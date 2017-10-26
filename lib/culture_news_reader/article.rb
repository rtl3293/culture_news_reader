class CultureNewsReader::Article
	attr_accessor :title, :description, :link
	@@all = []
	def initialize(title:, description:, link:)
		@title = title
		@description = description
		@link = link
		@@all << self
	end

	def open
		Launchy.open(@link)
	end

	def self.all
		@@all
	end
end
