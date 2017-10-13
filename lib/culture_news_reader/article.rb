class Article
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

	def self.display_all
		@@all.each_with_index do |article, i|
			puts "#{i+1}. #{article.title}"
			puts "#{article.description}"
			puts "---------------------------------------"
		end
	end
end
