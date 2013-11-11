class Comment < ActiveRecord::Base
	default_scope -> { order('created_at DESC') }
  belongs_to :content
  #belongs_to :user
	validates :content_id, presence: true
	#validates :user_id, presence: true
end
