class Enterprise::AccountSessionsController < EnterprisesController

  def new
    render :new, layout: 'company_apply_login'
  end

  def create
    @account = Account.find_by_name(params[:name])

    unless @account
      flash.now[:warning] = t('common.not_exist', name: '账号')
      return render :new, layout: 'company_apply_login'
    end

    if @account.authenticate(params[:password])
      flash[:notice] = t('success_login')
      redirect_to enterprise_overview_path
    else
      flash[:warning] = t('password_not_match')
      render :new, layout: 'company_apply_login'
    end
  end

  def destroy
  end

end
