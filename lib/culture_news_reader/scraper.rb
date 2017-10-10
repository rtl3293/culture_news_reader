

class Scraper
	THE_FADER_URL = 'http://www.thefader.com/'
	def self.scrape_music_page(music_url)
		html = open(THE_FADER_URL + music_url)
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
		scraped_stories
	end

	def self.scrape_style_page(style_url)
		html = open(THE_FADER_URL + style_url)
		doc = Nokogiri::HTML(html)
		stories = doc.css("div.card.pinned_post")
		scraped_stories = stories.collect do |story|
			{:title => story.css(".card_headline").text,
			 :description =>story.css(".card_summary").text,
			 :link => THE_FADER_URL + story.css("a")[0]['href']}
		end
	end

	def self.scrape_culture_page(culture_url)
		html = open(THE_FADER_URL + culture_url)
		doc = Nokogiri::HTML(html)
		stories = doc.css("div.card.pinned_post")
		scraped_stories = stories.collect do |story|
			{:title => story.css(".card_headline").text,
			 :description =>story.css(".card_summary").text,
			 :link => THE_FADER_URL + story.css("a")[0]['href']}
		end
	end

	def self.scrape_trending_stories(trending_url)
		html = open(THE_FADER_URL + trending_url)
		doc = Nokogiri::HTML(html)
		stories = doc.css("div.featured_post")
		scraped_stories = stories.collect do |story|
			{:title => story.css(".card_headline").text}
		end
	end


end
