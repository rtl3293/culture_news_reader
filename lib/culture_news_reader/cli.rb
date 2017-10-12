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
				music = Scraper.scrape_page('music')
				music.each_with_index do |article, i|
					puts "#{i+1}. #{article[:title]}"
					puts "#{article[:description]}"
					puts "---------------------------------------"
				end
				#puts music
				launcher(music)
			when "2"
				#puts "Style News..."
				style = Scraper.scrape_page('style')
				style.each_with_index do |article, i|
					puts "#{i+1}. #{article[:title]}"
					puts "#{article[:description]}"
					puts "---------------------------------------"
				end
				launcher(style)
			when "3"
				culture = Scraper.scrape_page('culture')
				culture.each_with_index do |article, i|
					puts "#{i+1}. #{article[:title]}"
					puts "#{article[:description]}"
					puts "---------------------------------------"
				end
				launcher(culture)
			when "4"
				puts Scraper.scrape_trending_stories('trending')

			when "list"
				list_categories
			end
		end
	end

	def launcher(page)
		puts "Which article would you like to read?"
		#input = gets.strip

	end



end
