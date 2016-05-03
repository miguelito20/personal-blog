class WelcomeController < ApplicationController
  def index
    @anniversary = Anniversary.new
  end
end