class Content < ActiveRecord::Base
<<<<<<< HEAD
	validates_presence_of :code, :cat, :desc, :context

	has_many :comments, dependent: :destroy

=======
validates_presence_of :code, :cat, :desc, :context
>>>>>>> 2e0fe8f8b6e49c0085ec4976cff37715ea0daf46
	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Content.create! row.to_hash

		end
	end
end
