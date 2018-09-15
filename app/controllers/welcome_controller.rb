class WelcomeController < ApplicationController
  def index
    render :hu, layout: 'enterprise'
  end
end