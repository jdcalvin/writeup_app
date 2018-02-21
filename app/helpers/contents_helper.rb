module ContentsHelper

	def table_helper
    table = Content.uniq.pluck(:section)
    table.delete(nil)
    table.sort!
  end
  	
	def table_linker
	 @contents = Content.all
	end

end