class Enterprise::MainController < EnterprisesController
  before_action :require_account_login
  
  # 后台概览
  def overview
    @company = current_account.company
  end


end
