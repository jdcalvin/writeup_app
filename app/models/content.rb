class Content < ActiveRecord::Base
	
	validates_presence_of :code, :desc
	#default_scope -> { order('code ASC') }  REMOVED
	has_many :comments, dependent: :destroy

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Content.create! row.to_hash
		end
	end

	def self.search(search=nil)
    scoped =  if search
                where('contents.code || contents.cat || contents.desc || contents.section || contents.context ILIKE ?', search)
              else
                all
              end

    scoped.order('code')
	end

end
