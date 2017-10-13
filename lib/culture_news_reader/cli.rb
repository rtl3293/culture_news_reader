class CultureNewsReader::CLI
	@@categories = ["Music", "Style", "Culture", "Trending"]
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
			puts "Enter the number for the news you'd like, list to see the categories, or type exit:"
			input = gets.strip.downcase
			case input
			when "1"
				Article.display_all.clear
				music = CultureNewsReader::Scraper.page(@@categories[input.to_i - 1])
				Article.display_all
				#puts music
				launcher(music)
			when "2"
				Article.display_all.clear
				style = CultureNewsReader::Scraper.page(@@categories[input.to_i - 1])
				Article.display_all
				launcher(style)
			when "3"
				Article.display_all.clear
				culture = CultureNewsReader::Scraper.page(@@categories[input.to_i - 1])
				Article.display_all
				launcher(culture)
			when "4"
				Article.display_all.clear
				trending = CultureNewsReader::Scraper.trending_page(@@categories[input.to_i - 1])
				Article.display_all
				launcher(trending)
			when "list"
				list_categories
			when "exit"
				puts "Stay Faded"
			else
				puts "Invalid. Please try again."
			end
		end
	end

	def launcher(page)
		input = nil
		while input != "exit"
			puts "Enter the article number you would like to preview, or type exit:"
			input = gets.strip.downcase
			if input == "exit"
				return
			elsif input.to_i <= page.length
				puts "------------------------------------------------------------------------------"
				puts "			#{page[input.to_i - 1].title}"	
				puts "------------------------------------------------------------------------------"
				CultureNewsReader::Scraper.story(page[input.to_i - 1])
				puts "Would you like to read this? Y/n"
				y_or_n = gets.strip.downcase
				if y_or_n == "y"
					page[input.to_i - 1].open
				end
			else
				puts "Please try again"
			end
		end		
	end



end
