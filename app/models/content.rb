class Content < ActiveRecord::Base
	
	validates_presence_of :code, :desc
	#default_scope -> { order('code ASC') }  REMOVED
	has_many :comments, dependent: :destroy

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Content.create! row.to_hash
		end
	end



	
	
#TIRE
#def self.search(params)
 # tire.search(load: true) do
  #  query { string params[:query]} if params[:query].present?
   # filter :range, published_at: {lte: Time.zone.now }
  #end
#end

#OLD SEARCH
	def self.search(search)
		if search	
    	Content.find(:all, :conditions => 
    		['contents.code || contents.cat || contents.desc || 
    			contents.section || contents.context ILIKE?', "%#{search}%"])
 		else
    	@contents = Content.find(:all)
    	@contents = Content.order('code')
    	

  	end
	end
	

end
