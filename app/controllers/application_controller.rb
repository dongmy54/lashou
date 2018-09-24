class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # views controller 共用
  helper_method :current_applicant
  helper_method :applicant_is_login?
  helper_method :has_deliver?

  # 当前求职者
  def current_applicant
    applicant_id = session[:applicant_id]
    return nil unless applicant_id
    Applicant.find_by_id(applicant_id)
  end

  # 求职者 登录？
  def applicant_is_login?
    current_applicant.present?
  end

  # 是否 已投递
  def has_deliver?(job_id)
    current_applicant.send_delivers.where(job_id: job_id).present?
  end

  private

end
