class ApplicantSessionsController < ApplicationController
  before_action :login_valid, only: :create

  # 登录页面
  def new
  end

  # 登录
  def create
    email,password = params[:email], params[:password]
    @applicant     = Applicant.find_by_email(email)

    # 求职者不存在
    unless @applicant
      flash.now[:warning] = t("common.not_exist", name: '用户')
      return render :new
    end

    # 认证
    if @applicant.authenticate(password)
      session[:applicant_id] = @applicant.id
      flash[:notice]         = t('success_login')
      redirect_to root_path
    else
      flash[:warning] = t('password_not_match')
      render 'new'
    end
  end

  # 退出
  def destroy
    session[:applicant_id] = nil
    @applicant             = nil
    flash[:notice]         = t("success_exit")
    redirect_to root_path
  end

  private
    # 登录验证参数 email password
    def login_valid
      if params[:email].blank?
        flash.now[:warning] = t("common.can_not_be_empty", name: '邮箱')
        return render :new
      elsif params[:password].blank?
        flash.now[:warning] = t("common.can_not_be_empty", name: '密码')
        return render :new
      end
    end

end
