class Content < ActiveRecord::Base
	validates_presence_of :code, :cat, :desc, :context, :section
	default_scope -> { order('code ASC') }
	has_many :comments, dependent: :destroy


	
	def self.unique_by_section
		all.uniq_by(:section)
	end


	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Content.create! row.to_hash

		end
	end

	def self.search(search)
		if search
    	find(:all, :conditions => ['code || cat || desc || context LIKE?', "%#{search}%"])
    	
 		else
    	find(:all)
  	end
	end
	

end
