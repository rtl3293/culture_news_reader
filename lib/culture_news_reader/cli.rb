class CultureNewsReader::CLI

	def call
		list_categories
		menu
	end

	def list_categories
		puts "The Fader"
		categories = ["Music", "Style", "Culture"]
		categories.each_with_index do |category, i|
			puts "#{i+1}. #{category}"
		end
	end

	def menu
		input = nil	
		while input != "exit"
			puts "Enter the number for the news you'd like:"
			input = gets.strip.downcase
			case input
			when "1"
				puts "Music News..."
			when "2"
				puts "Style News..."
			when "list"
				list_categories
			end
		end
	end



end
