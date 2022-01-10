class VideoCommentsController < ApplicationController
  before_action :set_video_comment, only: %i[ show edit update destroy ]

  # GET /video_comments or /video_comments.json
  def index
    @video = Video.friendly.find(params[:id])
    @video_comments = VideoComment.where(video_id: @video.id)
  end

  # GET /video_comments/1 or /video_comments/1.json
  def show
  end

  # GET /video_comments/new
  def new
    @video_comment = current_user.video_comments.new
  end

  # GET /video_comments/1/edit
  def edit
  end

  # POST /video_comments or /video_comments.json
  def create
    @video_comment = current_user.video_comments.new(video_comment_params)
    @video = Video.friendly.find(@video_comment.video_id)
    
    respond_to do |format|
      if @video_comment.save
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "new_video_comment",
            partial: "video_comments/form",
            locals: { video_comment: current_user.video_comments.new, video_id: @video_comment.video_id }
          )
        }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /video_comments/1 or /video_comments/1.json
  def update
    respond_to do |format|
      if @video_comment.update(video_comment_params)
        format.html { redirect_to video_comment_url(@video_comment), notice: "Video comment was successfully updated." }
        format.json { render :show, status: :ok, location: @video_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_comments/1 or /video_comments/1.json
  def destroy
    @video_comment.destroy

    respond_to do |format|
      format.html { redirect_to video_comments_url, notice: "Video comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_comment
      @video_comment = VideoComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_comment_params
      params.require(:video_comment).permit(:user_id, :video_id, :content)
    end
end
