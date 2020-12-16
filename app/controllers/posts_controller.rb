class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def create
        @post = Post.create(post_param.except(:likes))
        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
        @post = Post.find(params[:id])
        @bloggers = Blogger.all
        @destinations = Destinations.all
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_param)
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path
        end 
    end 

    def likes
        @post = Post.find(params[:id])
        @post.like
        @post.save
        redirect_to post_path(@post)
    end

    private

    def post_param
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
 
end 

