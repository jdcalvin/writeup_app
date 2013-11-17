module ContentsHelper


	def table_helper
	table = Content.uniq.pluck(:code, :section)
	table.each do |x, y|
		x.gsub!(/\d/, '')	
		end

	table.uniq
	end


	def content_search
		@contents = Content.search("#{query}")
	end
end
