class WelcomeController < ApplicationController
  
  def index
    # 默认情况下 展示 最近发布6个职位
    @jobs = Job.includes(company: :industry).order(created_at: :desc).limit(6)
  end

end