class RentPostsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_rent_post, only: [:show, :edit, :update, :destroy]

  # GET /rent_posts
  # GET /rent_posts.json
  def index
    @rent_posts = RentPost.all
  end

  # GET /rent_posts/1
  # GET /rent_posts/1.json
  def show
  end

  # GET /rent_posts/new
  def new
    @rent_post = RentPost.new
  end

  # GET /rent_posts/1/edit
  def edit
    check_user
  end

  # POST /rent_posts
  # POST /rent_posts.json
  def create
    @rent_post = RentPost.new(rent_post_params)

    respond_to do |format|
      if @rent_post.save
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
    respond_to do |format|
      if @rent_post.update(rent_post_params)
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
    respond_to do |format|
      format.html { redirect_to rent_posts_url, notice: 'Rent post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent_post
      @rent_post = RentPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rent_post_params
      params.require(:rent_post).permit(:lens_name, :image, :mount, :zoom_lens, :distance, :aperture, :is, :location, :price, :rented, :content, :user_id)
    end
    
    def check_user
      if @rent_post.user != current_user
        redirect_to root_url
      end
    end 
end
