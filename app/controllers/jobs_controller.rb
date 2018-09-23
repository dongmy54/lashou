class JobsController < ApplicationController

  # 职位检索
  def search
    @jobs, @current_page, @total_page = Job.search(params[:search], params[:current_page])
  end

end
