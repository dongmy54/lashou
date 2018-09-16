class Enterprise::CompanySessionsController < EnterprisesController

  def new
    render :new, layout: 'company_apply_login'
  end

  def create
    @company = Company.find_by_name(params[:name])
    
    unless @company
      flash[:warning] = t('common.not_exist', name: '公司')
      return redirect_to enterprise_root_path
    end

    if @company.authenticate(params[:password])
      flash[:notice]       = t('success_login')
      session[:company_id] = @company.id
      redirect_to enterprise_company_path(@company)
    else
      flash.now[:warning] = t('password_not_match')
      render :new, layout: 'company_apply_login'
    end
  end

  def destroy
  end

  private
  
end