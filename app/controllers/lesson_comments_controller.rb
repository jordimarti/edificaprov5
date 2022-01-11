class LessonCommentsController < ApplicationController
  before_action :set_lesson_comment, only: %i[ show edit update destroy ]

  # GET /lesson_comments or /lesson_comments.json
  def index
    @lesson = Lesson.friendly.find(params[:id])
    @lesson_comments = LessonComment.where(lesson_id: @lesson.id)
  end

  # GET /lesson_comments/1 or /lesson_comments/1.json
  def show
  end

  # GET /lesson_comments/new
  def new
    @lesson_comment = current_user.lesson_comments.new
  end

  # GET /lesson_comments/1/edit
  def edit
  end

  # POST /lesson_comments or /lesson_comments.json
  def create
    @lesson_comment = current_user.lesson_comments.new(lesson_comment_params)
    @lesson = Lesson.friendly.find(@lesson_comment.lesson_id)
    
    respond_to do |format|
      if @lesson_comment.save
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "new_lesson_comment",
            partial: "lesson_comments/form",
            locals: { lesson_comment: current_user.lesson_comments.new, lesson_id: @lesson_comment.lesson_id }
          )
        }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_comments/1 or /lesson_comments/1.json
  def update
    respond_to do |format|
      if @lesson_comment.update(lesson_comment_params)
        format.html { redirect_to lesson_comment_url(@lesson_comment), notice: "Lesson comment was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_comments/1 or /lesson_comments/1.json
  def destroy
    @lesson_comment.destroy

    respond_to do |format|
      format.html { redirect_to lesson_comments_url, notice: "Lesson comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_comment
      @lesson_comment = LessonComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_comment_params
      params.require(:lesson_comment).permit(:user_id, :lesson_id, :content)
    end
end
