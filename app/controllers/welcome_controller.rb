class WelcomeController < ApplicationController
  def index
    flash.now[:alert] = 'sadf'
  end
end