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
		puts "Enter the number for the news you'd like:"
		category = gets.strip
	end



end
