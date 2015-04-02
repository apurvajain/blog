class CommentsController < ApplicationController
def index
    @comment = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comment/1
  # GET /comment/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comment/new
  # GET /comment/new.json
  def new
    @post = Post.where(id: params[:post_id]).first
    @comment = @post.comments.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # POST /comment
  # POST /comment.json
  def create
    @post = Post.where(id: params[:post_id]).first
    @comment = @post.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment/1
  # DELETE /comment/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_url(@comment.post_id) }
      format.json { head :no_content }
    end
  end
end
