class Comment < ActiveRecord::Base
	default_scope -> { order('created_at DESC') }
  belongs_to :content
	validates :content_id, presence: true
end
