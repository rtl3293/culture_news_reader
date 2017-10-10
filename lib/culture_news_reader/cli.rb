class CultureNewsReader::CLI

	def call
		puts "The Fader"
	end

	def menu
		categories = ["Music", "Style", "Culture"]
		puts "Enter the number for the news you'd like:"
		categories.each_with_index do |category, i|
			puts "#{i+1}. #{category}"
		end
	end

end
