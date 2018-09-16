class Enterprise::AccountsController < EnterprisesController
  before_action :require_login

  # 后台概览
  def overview
    @company = current_account.company
  end

  private

    def require_login
      redirect_to enterprise_account_login_path unless current_account
    end


end
