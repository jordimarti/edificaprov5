class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def videos
    @menu_videos = true
    @videos = Video.where(channel_id: current_channel.id)
  end

  def articles
  end

  def courses
  end

  def communities
  end

  def billing
  end
end
