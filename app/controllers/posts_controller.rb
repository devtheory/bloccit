class PostsController < ApplicationController

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comments = @post.comments #comment?
    @comment = Comment.new
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    #@comments = Comment.where(post_id: params[:id]) #comment?
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    #@comments = Comment.where(post_id: params[:id]) #comments?
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    authorize @post

    if @post.save
      redirect_to [@topic, @post], notice: "Post was saved."
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @comments = Comment.where(post_id: params[:id]) #comments?
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @comments = Comment.where(post_id: params[:id]) #comments?
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      redirect_to [@topic, @post], notice: "Post was updated."
    else
      flash[:error] = "There was an error saving the post"
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    title = @post.title

    authorize @post
    if @post.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end

  #method to post params
  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

end
