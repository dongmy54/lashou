class ApplicantsController < ApplicationController
  before_action :require_login, only: [:show, :update]

  # 个人主页
  def show
    @applicant = Applicant.find(params[:id])
  end

  def new
  end

  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.save
      flash[:notice] = '恭喜您注册成功'
      redirect_to root_path
    else
      flash.now[:warning] = @applicant.errors.messages
      render 'new'
    end
  end

  def update
    @applicant = Applicant.find(params[:id])
    if @applicant.update(applicant_params)
      flash[:notice] = t("common.success_update", name: '个人')
      redirect_to applicant_path(@applicant)
    else
      flash.now[:warning] = @applicant.errors.messages
      render :show
    end
  end


  private
    def applicant_params
      params.require(:applicant).permit(:address,:age,:avatar,:blog_address,
                                        :city, :education, :email, :mobile, :name,
                                        :password, :password_confirmation, :sex, :school)
    end

    def require_login
      redirect_to root_path unless current_applicant
    end
end
