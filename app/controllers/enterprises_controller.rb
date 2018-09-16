class EnterprisesController < ActionController::Base
  layout 'enterprise'

  protect_from_forgery with: :exception

  helper_method :current_company

  def current_company
    return nil unless session[:company_id]
    @company = Company.find_by_id(session[:company_id])
    @company
  end

  def current_account
    return nil unless session[:account_id]
    @account = Account.find_by_id(session[:account_id])
    @account
  end

end