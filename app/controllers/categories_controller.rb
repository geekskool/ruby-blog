class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
  	@category_id = params[:id]
  	@posts = Post.all
  	@categories = Category.all
  end
end