class CultureNewsReader::CLI

	def call
		list_categories
		menu
	end

	def list_categories
		puts "The Fader"
		categories = ["Music", "Style", "Culture", "Trending"]
		categories.each_with_index do |category, i|
			puts "#{i+1}. #{category}"
		end
	end

	def menu
		fader_url = 'http://www.thefader.com/'
		input = nil	
		while input != "exit"
			puts "Enter the number for the news you'd like:"
			input = gets.strip.downcase
			case input
			when "1"
				#puts "Music News..."
				puts Scraper.scrape_music_page('music')
			when "2"
				#puts "Style News..."
				puts Scraper.scrape_style_page('style')
			when "3"
				puts Scraper.scrape_culture_page('culture')
			when "4"
				puts Scraper.scrape_trending_stories('trending')
			when "list"
				list_categories
			end
		end
	end



end
