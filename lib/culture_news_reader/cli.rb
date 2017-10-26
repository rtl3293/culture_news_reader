class CultureNewsReader::CLI
	@@categories = ["Music", "Style", "Culture", "Trending"]
	def call
		create_categories
		list_categories
		menu
	end

	def create_categories
		@@categories.each do |category|
			CultureNewsReader::Category.new(category)
		end
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
			#case input
			# when "1"
				#CultureNewsReader::Article.all.clear
			if input.to_i.between?(1, 3)
				category = CultureNewsReader::Category.all[input.to_i - 1]
				CultureNewsReader::Scraper.page(category)
				list_articles(category)
				#puts music
				launcher(category)
			elsif input.to_i == 4
				category = CultureNewsReader::Category.all[input.to_i - 1]
				CultureNewsReader::Scraper.trending_page(category)
				list_articles(category)
				launcher(category)
			elsif input == "list"
				list_categories
			elsif input == "exit"
				puts "Stay Faded"
			else
				puts "Invalid. Please try again."
			end
		end
	end

	def launcher(category)
		input = nil
		while input != "exit"
			puts "Enter the article number you would like to preview, or type exit:"
			input = gets.strip.downcase
			if input == "exit"
				return
			elsif input.to_i <= category.articles.length
				puts "------------------------------------------------------------------------------"
				puts "#{category.articles[input.to_i - 1].title}"
				puts "------------------------------------------------------------------------------"
				puts CultureNewsReader::Scraper.story(category.articles[input.to_i - 1])
				puts "------------------------------------------------------------------------------"
				puts "Would you like to read this? Y/n"
				y_or_n = gets.strip.downcase
				if y_or_n == "y"
					category.articles[input.to_i - 1].open
				end
			else
				puts "Please try again"
			end
		end
	end

	def list_articles(category)
			category.articles.each_with_index do |article, i|
				puts "#{i+1}. #{article.title}"
				puts "#{article.description}"
				puts "---------------------------------------"
			end
	end



end
