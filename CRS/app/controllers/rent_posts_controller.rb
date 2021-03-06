class RentPostsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_rent_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /rent_posts
  # GET /rent_posts.json
  
  def index
    if params.has_key?(:content)
      @rent_posts = RentPost.order("created_at DESC").page(params[:page]).per(5).where('content like ?', "%#{params[:content]}%")
    else
      @rent_posts = RentPost.where(rented: false).order("created_at DESC").page(params[:page]).per(5)
    end
  end

  # GET /rent_posts/1
  # GET /rent_posts/1.json
  def show
    @post_attachment = PostAttachment.where(rent_post: @rent_post.id)
    @token = form_authenticity_token
    @current_user = current_user
  end

  # GET /rent_posts/new
  def new
    @rent_post = RentPost.new
    @post_attachment = @rent_post.post_attachments.build
  end

  # GET /rent_posts/1/edit
  def edit
  end

  # POST /rent_posts
  # POST /rent_posts.json
  def create
    @rent_post = RentPost.new(rent_post_params)
    # @post_attachment = @rent_post.post_attachments.build

    respond_to do |format|
      if @rent_post.save
        if params[:post_attachments]!=nil
          params[:post_attachments]['image'].each do |a|
            @post_attachment = @rent_post.post_attachments.create!(:image => a, :rent_post_id => @rent_post.id)
          end
        else
          @post_attachment = @rent_post.post_attachments.create!(:image => nil, :rent_post_id => @rent_post.id)
        end
        format.html { redirect_to @rent_post, notice: 'Rent post was successfully created.' }
        format.json { render :show, status: :created, location: @rent_post }
      else
        format.html { render :new }
        format.json { render json: @rent_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rent_posts/1
  # PATCH/PUT /rent_posts/1.json
  def update
    @post_attachment = PostAttachment.where(rent_post: @rent_post.id)
    
    respond_to do |format|
      if @rent_post.update(rent_post_params)
        if params[:post_attachments]!=nil
          @post_attachment.destroy_all
          params[:post_attachments]['image'].each do |a|
            @post_attachment = @rent_post.post_attachments.create!(:image => a, :rent_post_id => @rent_post.id)
          end
        end
        format.html { redirect_to @rent_post, notice: 'Rent post was successfully updated.' }
        format.json { render :show, status: :ok, location: @rent_post }
      else
        format.html { render :edit }
        format.json { render json: @rent_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rent_posts/1
  # DELETE /rent_posts/1.json
  def destroy
    check_user
    @rent_post.destroy
    @post_attachment = PostAttachment.where(rent_post: @rent_post.id)
    @post_attachment.destroy_all
    respond_to do |format|
      format.html { redirect_to rent_posts_url, notice: 'Rent post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def mypage
    @rent_posts = current_user.rent_posts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent_post
      @rent_post = RentPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rent_post_params
      params.require(:rent_post).permit(:lens_name, :mount, :zoom_lens, :distance, :aperture, :is, :location, :price, :rented, :content, :user_id, post_attachments_attributes: 
  [:id, :rent_post_id, :image])
    end
    
    def check_user
      if @rent_post.user != current_user
        redirect_to root_url
      end
    end 
end
