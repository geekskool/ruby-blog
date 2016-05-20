class PostsController < ApplicationController
	def index
		@posts = Post.all
		@categories = Category.all
	end

	def show
		@post = Post.find(params[:id])
		# @categories = Category.all
		@category_id = params[:id]
		@categories = Category.all

	end

	def new
		@post = Post.new
		@cat = Category.all
	end

	def create
		@post = Post.new(params.require(:post).permit(:title, :body, :Category_id))
		if @post.save
			redirect_to posts_path, notice: "Post is saved"	
		else
			render "new"
		end
	end

	def edit
		@post = Post.find(params[:id])
		render "edit"
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params.require(:post).permit(:title, :body, :Category_id))
			redirect_to posts_path, notice: "Post is updated"
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, notice: "Post is Deleted"
	end	

end