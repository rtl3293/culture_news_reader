class Article
	attr_accessor :title, :description, :link
	
	def initialize(title:, description:, link:)
		@title = title
		@description = description
		@link = link
	end

end
