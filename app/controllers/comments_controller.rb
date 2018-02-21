class CommentsController < ApplicationController
	
	before_action :correct_user, only: :destroy
	
	 def create
  	@content = Content.find(params[:content_id]) #was content_id
  	
  	@comment = @content.comments.build(comment_params)
  	@comment.user = current_user
  	if @comment.save
  		flash[:success] = "Comment created"
  	#
  		redirect_to @content
  	else
  		render 'show'
  	end
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
