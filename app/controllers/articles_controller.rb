class ArticlesController < ApplicationController
  require 'comment'
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:edit, :update, :destroy, :new, :create]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @ac = @article.comments.paginate(page: params[:page], :per_page => 15)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

      if @article.save
        flash[:success] = "Successfully created post"
        redirect_to article_path(@article)
      else
        flash[:danger] = "Failed to create post"
        redirect_to article_path(@article)
      end
    end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update

      if @article.update(article_params)
        flash[:success] = "Successfully updated post"
        redirect_to article_path(@article)
      else
        flash[:danger] = "Failed to update post"
        redirect_to article_path(@article)
      end
    end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
