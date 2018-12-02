class UsersController < ApplicationController
    before_action :set_user
    load_and_authorize_resource
    # GET 'users/:id'
    def show
        @rent_posts = @user.rent_posts.order("created_at DESC").page(params[:page]).per(5)
    end
    
    #POST 'users/:id/follow'
    def follow
        @user.toggle_follow(current_user)
        redirect_back(fallback_location: root_path)
    end

    private
  
    def set_user
      @user = User.find(params[:id])
    end
end
