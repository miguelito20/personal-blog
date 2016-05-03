class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:edit, :update, :destroy, :create, :new]
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show

  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end


  # POST /comments
  # POST /comments.json
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Successfully created comment"
      redirect_to article_path(@article)
    else
      flash[:danger] = "Failed to create comment"
      redirect_to article_path(@article)
     end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.save
      flash[:success] = "Successfully edited comment"
    else
      flash[:danger] = "Failed to edit comment"
    end
    redirect_to article_path(@article)
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
      flash[:success] = "Successfully deleted comment"
    else
      flash[:danger] = "Failed to delete comment"
    end
    redirect_to article_path(@article)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :body)
    end
end
