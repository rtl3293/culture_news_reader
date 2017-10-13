class CultureNewsReader::Scraper
	THE_FADER_URL = 'http://www.thefader.com/'
	def self.scrape_page(url)
		page = url.downcase
		#binding.pry
		html = open(THE_FADER_URL + page)
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
		#binding.pry
		articles = scraped_stories.collect do |article|
			Article.new(article)
		end
		articles
	end

	def self.scrape_trending_stories(url)
		page = url.downcase
		html = open(THE_FADER_URL + page)
		doc = Nokogiri::HTML(html)
		stories = doc.css("div.featured_post")
		scraped_stories = stories.collect do |story|
			#binding.pry
			article = {:title => story.css(".card_headline").text,
			:description => story.css(".card_summary").text}
			if article[:title] != "" && article[:description] != ""
				article[:link] = THE_FADER_URL + story.css("a")[0]['href']
			end
			article
		#binding.pry
		end
		scraped_stories.delete_if {|a| a[:title] == "" && a[:description] == ""}
		articles = scraped_stories.collect do |article|
			Article.new(article)
		end
		articles
	end


end
