class ArticlesController < ApplicationController
  def new
    
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(_params()) then
      #redirect_to :index
    else
      render action: :edit
    end
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(_params())
    if @article.valid? then
      @article.save
      redirect_to '/'
    else
      render action: :new
    end
    #render(plain: params[:article].inspect)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to '/'
  end
  
  private

  def _params()
    params.require(:article).permit(:title, :author, :text)
  end

end
