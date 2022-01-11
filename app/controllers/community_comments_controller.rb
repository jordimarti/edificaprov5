class CommunityCommentsController < ApplicationController
  before_action :set_community_comment, only: %i[ show edit update destroy ]

  # GET /community_comments or /community_comments.json
  def index
    @community = Community.friendly.find(params[:id])
    @community_comments = CommunityComment.where(community_id: @community.id)
  end

  # GET /community_comments/1 or /community_comments/1.json
  def show
  end

  # GET /community_comments/new
  def new
    @community_comment = current_user.community_comments.new
  end

  # GET /community_comments/1/edit
  def edit
  end

  # POST /community_comments or /community_comments.json
  def create
    @community_comment = current_user.community_comments.new(community_comment_params)
    @community = Community.friendly.find(@community_comment.community_id)
    
    respond_to do |format|
      if @community_comment.save
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "new_community_comment",
            partial: "community_comments/form",
            locals: { community_comment: current_user.community_comments.new, community_id: @community_comment.community_id }
          )
        }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @community_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_comments/1 or /community_comments/1.json
  def update
    respond_to do |format|
      if @community_comment.update(community_comment_params)
        format.html { redirect_to community_comment_url(@community_comment), notice: "Community comment was successfully updated." }
        format.json { render :show, status: :ok, location: @community_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @community_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_comments/1 or /community_comments/1.json
  def destroy
    @community_comment.destroy

    respond_to do |format|
      format.html { redirect_to community_comments_url, notice: "Community comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_comment
      @community_comment = CommunityComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def community_comment_params
      params.require(:community_comment).permit(:user_id, :community_id, :content)
    end
end
