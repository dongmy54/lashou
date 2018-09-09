class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # views controller 共用
  helper_method :current_applicant

  # 当前求职者
  def current_applicant
    @applicant ||= find_by_session
  end

  private
    # session中找
    def find_by_session
      applicant_id = session[:applicant_id]
      return nil unless applicant_id
      Applicant.find_by_id(session[:applicant_id])
    end

end
