class JobsController < ApplicationController

  # 职位检索
  def search
    @jobs, @current_page, @total_page = Job.search(params[:search], params[:current_page])
  end

  def show
    @job = Job.includes(company: :industry).find_by_id(params[:id])
    unless @job
      flash[:warning] = '职位不存在'
      redirect_to root_path
    end

    # 客户端缓存
    fresh_when last_modified: @job.updated_at.utc, etag: @job
  end

end
