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
		input = nil	
		while input != "exit"
			puts "Enter the number for the news you'd like or type exit:"
			input = gets.strip.downcase
			case input
			when "1"
				#puts "Music News..."
				music = Scraper.scrape_page('music')
				display(music)
				#puts music
				launcher(music)
			when "2"
				#puts "Style News..."
				style = Scraper.scrape_page('style')
				display(style)
				launcher(style)
			when "3"
				culture = Scraper.scrape_page('culture')
				display(culture)
				launcher(culture)
			when "4"
				trending = Scraper.scrape_trending_stories('trending')
				display(trending)
				launcher(trending)
			when "list"
				list_categories
			end
		end
	end

	def launcher(page)
		#fader_url = 'http://www.thefader.com/'
		input = nil
		while input != "exit"
			puts "Enter the article number you would like to read, or type exit:"
			input = gets.strip.downcase
			if input == "exit"
				return
			elsif input.to_i <= page.length
				site_to_open = page[input.to_i - 1][:link]
				Launchy.open(site_to_open)
			else
				puts "Please try again"
			end
		end		
	end

	def display(article_hash)
		article_hash.each_with_index do |article, i|
			puts "#{i+1}. #{article[:title]}"
			puts "#{article[:description]}"
			puts "---------------------------------------"
		end
	end


end
