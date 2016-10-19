class ArticlesController < ApplicationController
  def new
    
  end
  
  def update
    @article = Article.find(params[:id])
    @article.title = params['article[title]']
    @article.text = params['article[text]']
    @article.author = params['article[author]']
    if @article.valid? then
      @article.save
    else
      render action: :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(_params())
    if @article.valid? then
      @article.save
    else
      render action: :new
    end
    #render(plain: params[:article].inspect)
  end

  private

  def _params()
    params.require(:article).permit(:title, :author, :text)
  end

end