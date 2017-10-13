class CultureNewsReader::CLI
	@@categories = ["Music", "Style", "Culture", "Trending"].freeze
	def call
		list_categories
		menu
	end

	def list_categories
		puts "---------------------------------------"
		puts "	      The Fader"	
		puts "---------------------------------------"
		@@categories.each_with_index do |category, i|
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
				Article.display_all.clear
				music = CultureNewsReader::Scraper.scrape_page(@@categories[input.to_i - 1])
				Article.display_all
				#puts music
				launcher(music)
			when "2"
				Article.display_all.clear
				style = CultureNewsReader::Scraper.scrape_page(@@categories[input.to_i - 1])
				Article.display_all
				launcher(style)
			when "3"
				Article.display_all.clear
				culture = CultureNewsReader::Scraper.scrape_page(@@categories[input.to_i - 1])
				Article.display_all
				launcher(culture)
			when "4"
				Article.display_all.clear
				trending = CultureNewsReader::Scraper.scrape_trending_stories(@@categories[input.to_i - 1])
				Article.display_all
				launcher(trending)
			when "list"
				list_categories
			end
		end
	end

	def launcher(page)
		input = nil
		while input != "exit"
			puts "Enter the article number you would like to read, or type exit:"
			input = gets.strip.downcase
			if input == "exit"
				return
			elsif input.to_i <= page.length
				page[input.to_i - 1].open
			else
				puts "Please try again"
			end
		end		
	end



end
