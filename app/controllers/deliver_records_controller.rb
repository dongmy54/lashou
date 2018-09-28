class DeliverRecordsController < ApplicationController
  before_action :valid_deliver_record_data, only: :create

  # 投递前 验证登录 和 简历存在
  def valid_before_deliver
    result = {}
    # 登录
    unless applicant_is_login?
      result[:url] = login_path(type: 'not_login')    # 添加参数 为了跳转后 加提示
      render json: result and return # 提前返回
    end

    # 简历
    unless current_applicant.resumes.present?
      result[:url] = new_applicant_resume_path(current_applicant, type: 'resume_not_exist')
      render json: result and return
    end

    result[:resumes] = fetch_resume_data
    render json: result and return
  end

  # 投递简历
  def create
    delive_record = DeliverRecord.new(:job_id => params[:job_id], :resume_id => params[:resume_id])
    if delive_record.save
      flash[:notice] = '简历成功投递'
    else
      flash[:warning] = delive_record.errors.messages
    end

    redirect_back(fallback_location: root_path)
  end

  private

    # 获取 简历数据
    def fetch_resume_data
      current_applicant.resumes.pluck(:title, :id)
    end

    # 验证简历投递数据
    def valid_deliver_record_data
      applicant = current_applicant

      # 登录 
      unless applicant
        flash[:notice] = '亲,你还没登录呢'
        redirect_to login_path and return
      end

      # 有简历？
      unless applicant.resumes.present?
        flash[:warning] = "亲,你还没有简历哦" 
        redirect_to new_applicant_resume_path(applicant) and return
      end

      # resume_id 存在
      resume = Resume.find_by_id(params[:resume_id])
      unless resume 
        flash[:warning] = '亲,你选择的简历不存在'
        redirect_back(fallback_location: root_path) and return
      end

      # job_id 存在
      job = Job.find_by_id(params[:job_id])
      unless job
        flash[:warning] = '亲,该职位不存在'
        redirect_back(fallback_location: root_path) and return
      end

      # 简历所属
      unless resume.applicant == applicant
        flash[:warning] = '亲,该简历不属于你'
        redirect_back(fallback_location: root_path) and return
      end

      if has_deliver?(params[:job_id])
        flash[:warning] = '您已投递过该职位'
        redirect_back(fallback_location: root_path) and return
      end

    end

end
