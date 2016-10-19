class HomeController < ApplicationController
  def index
     @results = Article.order('created_at DESC').limit(5);
  end  
  def create
    
  end
end
