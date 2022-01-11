class QuestionCommentsController < ApplicationController
  before_action :set_question_comment, only: %i[ show edit update destroy ]

  # GET /question_comments or /question_comments.json
  def index
    @question = Question.friendly.find(params[:id])
    @question_comments = QuestionComment.where(question_id: @question.id)
  end

  # GET /question_comments/1 or /question_comments/1.json
  def show
  end

  # GET /question_comments/new
  def new
    @question_comment = current_user.question_comments.new
  end

  # GET /question_comments/1/edit
  def edit
  end

  # POST /question_comments or /question_comments.json
  def create
    @question_comment = current_user.question_comments.new(question_comment_params)
    @question = Question.friendly.find(@question_comment.question_id)
    
    respond_to do |format|
      if @question_comment.save
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "new_question_comment",
            partial: "question_comments/form",
            locals: { question_comment: current_user.question_comments.new, question_id: @question_comment.question_id }
          )
        }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_comments/1 or /question_comments/1.json
  def update
    respond_to do |format|
      if @question_comment.update(question_comment_params)
        format.html { redirect_to question_comment_url(@question_comment), notice: "Question comment was successfully updated." }
        format.json { render :show, status: :ok, location: @question_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_comments/1 or /question_comments/1.json
  def destroy
    @question_comment.destroy

    respond_to do |format|
      format.html { redirect_to question_comments_url, notice: "Question comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_comment
      @question_comment = QuestionComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_comment_params
      params.require(:question_comment).permit(:user_id, :question_id, :content)
    end
end
