class VideosController < ApplicationController
  before_action :set_video, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ list new edit create update destroy ]

  # GET /videos or /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1 or /videos/1.json
  def show
  end

  def list
    @menu_videos = true
    @videos = Video.where(channel_id: current_channel.id)
  end

  # GET /videos/new
  def new
    @menu_videos = true
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
    @menu_videos = true
  end

  # POST /videos or /videos.json
  def create
    @video = Video.new(video_params)
    @video.channel_id = current_channel.id

    respond_to do |format|
      if @video.save
        create_mux_video(@video)
        format.html { redirect_to edit_video_path(@video) }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_mux_video(video)
    assets_api = MuxRuby::AssetsApi.new
    create_asset = MuxRuby::CreateAssetRequest.new
    create_asset.input = url_for(video.file)
    puts "MUX URL: #{create_asset.input}"
    create_asset.playback_policy = [MuxRuby::PlaybackPolicy::PUBLIC]
    create_response = assets_api.create_asset(create_asset)  
    puts "MUX response playback id: #{create_response.data.playback_ids.first.id}"
    video.playback_id = create_response.data.playback_ids.first.id
    video.policy = create_response.data.playback_ids.first.policy
    video.mux_asset_id = create_response.data.id
    video.save
  end

  # PATCH/PUT /videos/1 or /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to video_url(@video), notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1 or /videos/1.json
  def destroy
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:channel_id, :title, :description, :score, :visible, :publicid, :playback_id, :policy, :mux_asset_id, :status, :max_stored_resolution, :max_stored_frame_rate, :duration, :aspect_ratio, :file)
    end
end
