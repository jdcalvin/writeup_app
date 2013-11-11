class CommentsController < ApplicationController
	
	before_action :correct_user, only: :destroy
	 def create
    	@content = Content.find(params[:content_id])
    	@comment = @content.comments.create!(comment_params)
    	redirect_to @content
    end

	 private

	 	def comment_params
			params.require(:comment).permit(:body)
		end

		def correct_user
			@comment = current_user.comments.find_by(id:params[:id])
			redirect_to root_url if @comment.nil?
		end
end
