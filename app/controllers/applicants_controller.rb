class ApplicantsController < ApplicationController
  def new
    @applicant = Applicant.new
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

  private
    def applicant_params
      params.require(:applicant).permit(:address,:age,:avatar,:blog_address,
                                        :city, :education, :email, :mobile, :name,
                                        :password, :password_confirmation, :sex, :scholl)
    end
end
