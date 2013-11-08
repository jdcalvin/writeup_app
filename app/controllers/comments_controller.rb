class CommentsController < ApplicationController
	 def create
                @content = Content.find(params[:content_id])
                @comment = @content.comments.create!(comment_params)
                redirect_to @content
        end

	 private

	 	def comment_params
			params.require(:comment).permit(:body)
		end
end
