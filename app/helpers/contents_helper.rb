module ContentsHelper


	def table_helper
        table = Content.uniq.pluck(:section)
        table.delete(nil)
        table.sort!
        #table.each do |x, y|
         #       x.gsub!(/\d/, '')        
          #      end

        #table.uniq
        end
  	
  	def table_linker
  	@contents = Content.all
  	end

end