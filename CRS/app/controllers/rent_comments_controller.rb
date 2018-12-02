class RentCommentsController < ApplicationController
    def create
        comment = RentComment.new
        comment.content = params[:input_content]
        comment.rent_post_id = params[:rent_post_id]
        comment.user_id = params[:current_user]
        comment.save
        redirect_to "/rent_posts/#{comment.rent_post_id}"
    end
    
    def destroy
        comment = RentComment.find params[:id]
        comment.destroy
        redirect_to "/rent_posts/#{comment.rent_post_id}"
    end
end
