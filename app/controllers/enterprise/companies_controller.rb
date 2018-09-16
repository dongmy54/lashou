class Enterprise::CompaniesController < EnterprisesController

  def show
    @company = Company.find(params[:id])
    render :show, layout: 'company_apply_login'
  end

  def new
    return redirect_to enterprise_overview_path if current_account # 如果已经登陆
    @company = Company.new
    render :new, layout: 'company_apply_login'
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      flash[:notice] = '企业申请已提交成功,审核结果将在1-2个工作日处理,请耐心等待。'
      company_login
      redirect_to enterprise_company_path(@company)
    else
      flash[:warning] = @company.errors.messages
      render :new, layout: 'company_apply_login'
    end
  end

  private

    def company_params
      params.require(:company).permit(:name, :scale, :industry_id, :city, :password, :password_confirmation)
    end

    def company_login
      session[:company_id] = @company.id
    end

end
