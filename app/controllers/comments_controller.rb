class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @comment = Comment.find(params[:id])
  end
  
  def modify
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @comment = Comment.find(params[:id])    
    @post = Post.find(@comment.post_id)
  end

  # POST /comments
  # POST /comments.json
  def create
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @comment = Comment.new(params[:comment])

#    @post = Post.find(params[:comment][:post_id])
#    @comment.save
#    @type_is = params[:type_is]
#    redirect_to post_path(@post, :type_is => @type_is)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @comment = Comment.find(params[:id])

#    @post = Post.find(@comment.post_id)
#    @comment.update_attributes(params[:comment])
#    @type_is = params[:type_is]
#    redirect_to post_path(@post, :type_is => @type_is)

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @comment.destroy
    redirect_to @post
    

#    respond_to do |format|
#      format.html { redirect_to comments_url }
#      format.json { head :no_content }
#    end
 
   end

end
