class HomeController < ApplicationController
  def index
    @tables = Settings.tables
  end
end
