class CultureNewsReader::Scraper
	THE_FADER_URL = 'http://www.thefader.com'
	def self.page(category)
		page = "/" + category.name.downcase
		html = open(THE_FADER_URL +  page)
		doc = Nokogiri::HTML(html)
		stories = doc.css("div.card.pinned_post")
		scraped_stories = stories.collect do |story|
			{:title => story.css(".card_headline").text,
			 :description =>story.css(".card_summary").text,
			 :link => THE_FADER_URL + story.css("a")[0]['href']}
		end
		if scraped_stories[0] == scraped_stories[1]
			scraped_stories.shift
		end
		scraped_stories.each do |article|
			new_article = CultureNewsReader::Article.new(article)
			category.add_article(new_article)
		end
	end

	def self.trending_page(category)
		page = "/" + category.name.downcase

		html = open(THE_FADER_URL + page)
		doc = Nokogiri::HTML(html)
		stories = doc.css("div.featured_post")
		scraped_stories = stories.collect do |story|
			article = {:title => story.css(".card_headline").text,
			:description => story.css(".card_summary").text}
			if article[:title] != "" && article[:description] != ""
				article[:link] = THE_FADER_URL + story.css("a")[0]['href']
			end
			article
		end
		scraped_stories.delete_if {|a| a[:title] == "" && a[:description] == ""}
		scraped_stories.each do |article|
			new_article = CultureNewsReader::Article.new(article)
			category.add_article(new_article)
		end
	end

	def self.story(article)
		#binding.pry
		html = open(article.link)
		doc = Nokogiri::HTML(html)
		preview = doc.css(".paragraph_wrapper p:first").text.split("\n")
		preview[1].strip
	end



end
