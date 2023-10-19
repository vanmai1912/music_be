class DashboardsController < ApplicationController
  def index
    @user_count_by_month = User.group("strftime('%Y-%m', created_at)").count.to_json

    @song_count_by_month = Song.group("strftime('%Y-%m', created_at)").count.to_json
    @singer_count_by_month = Singer.group("strftime('%Y-%m', created_at)").count.to_json

  end
end