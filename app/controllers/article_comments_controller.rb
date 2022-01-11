class ArticleCommentsController < ApplicationController
  before_action :set_article_comment, only: %i[ show edit update destroy ]

  # GET /article_comments or /article_comments.json
  def index
    @article = Article.friendly.find(params[:id])
    @article_comments = ArticleComment.where(article_id: @article.id)
  end

  # GET /article_comments/1 or /article_comments/1.json
  def show
  end

  # GET /article_comments/new
  def new
    @article_comment = current_user.article_comments.new
  end

  # GET /article_comments/1/edit
  def edit
  end

  # POST /article_comments or /article_comments.json
  def create
    @article_comment = current_user.article_comments.new(article_comment_params)
    @article = Article.friendly.find(@article_comment.article_id)
    
    respond_to do |format|
      if @article_comment.save
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "new_article_comment",
            partial: "article_comments/form",
            locals: { article_comment: current_user.article_comments.new, article_id: @article_comment.article_id }
          )
        }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_comments/1 or /article_comments/1.json
  def update
    respond_to do |format|
      if @article_comment.update(article_comment_params)
        format.html { redirect_to article_comment_url(@article_comment), notice: "Article comment was successfully updated." }
        format.json { render :show, status: :ok, location: @article_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_comments/1 or /article_comments/1.json
  def destroy
    @article_comment.destroy

    respond_to do |format|
      format.html { redirect_to article_comments_url, notice: "Article comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_comment
      @article_comment = ArticleComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_comment_params
      params.require(:article_comment).permit(:user_id, :article_id, :content)
    end
end
