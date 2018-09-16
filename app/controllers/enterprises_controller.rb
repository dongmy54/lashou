class EnterprisesController < ActionController::Base
  layout 'enterprise'

  protect_from_forgery with: :exception

end