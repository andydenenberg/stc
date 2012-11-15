class PostsController < ApplicationController
  before_filter :authenticate_user!
  
#  def add_attachment
#    authorize! :add_attachment, @user, :message => 'Not authorized as an administrator.'
#    @post = Post.find(params[:post])
#    @attachment = Attachment.new
#    @user = current_user
#    @attach_url = params[:attach_url]
#    render :partial => 'add_attachment', :layout => false    
#  end
#
#  def add_comment
#    authorize! :add_comment, @user, :message => 'Not authorized as an administrator.'
#    @post = Post.find(params[:post])
#    @comment = Comment.new
#    @user = current_user
#    render :partial => 'add_comment', :layout => false    
#  end
  
  def search
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    if params[:type_is] == 'Show Discussions & News' 
      type_is = '' 
    elsif params[:type_is] == 'Show Discussion' 
      type_is = 'type_is = "discussion"' 
    elsif params[:type_is] == 'Show News' 
      type_is = 'type_is = "news"' 
    end
    @posts = Post.where(type_is).paginate(:page => params[:page], :per_page => 5)
    
    render :partial => 'index', :layout => false       
  end
  
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
#    @posts = Post.paginate(:page => params[:page], :per_page => 3)
    params[:type_is] ||= 'All'
    if params[:type_is] == 'All' 
      type_is = '' 
    else
      type_is = 'type_is = "' + params[:type_is] + '"' 
    end
    @posts = Post.where(type_is).paginate(:page => params[:page], :per_page => 5)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    authorize! :show, @user, :message => 'Not authorized as an administrator.'
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    authorize! :new, @user, :message => 'Not authorized as an administrator.'
    @item_type = params[:item_type]
    @post = Post.new
    @post.attachments.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    authorize! :edit, @user, :message => 'Not authorized as an administrator.'
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    authorize! :create, @user, :message => 'Not authorized as an administrator.'
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
