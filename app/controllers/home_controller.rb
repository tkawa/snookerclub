class HomeController < ApplicationController
  def index
    @tables = Settings.tables
    @current_plays = Play.current(Time.now).group_by(&:table_id)
    @current_plays.default = []
  end
end
