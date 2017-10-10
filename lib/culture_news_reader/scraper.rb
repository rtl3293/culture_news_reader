

class Scraper

	def self.scrape_music_page(music_url)
		html = open(music_url)
		doc = Nokogiri::HTML(html)
		stories = doc.css("div.card.pinned_post")
		scraped_stories = stories.collect do |story|
			{:title => story.css(".card_headline").text,
			 :description =>story.css(".card_summary").text,
			 :link => story.css("a")[0]['href']}
		end
		if scraped_stories[0] == scraped_stories[1]
			scraped_stories.shift
		end
		binding.pry
	end

	def self.scrape_style_page(style_url)
		html = open(style_url)
		doc = Nokogiri::HTML(html)
		stories = doc.css("")
	end

	def self.scrape_culture_page(culture_url)
		html = open(culture_url)
		doc = Nokogiri::HTML(html)
		stories = doc.css("")
	end

	def self.scrape_trending_stories(trending_url)
		html = open(trending_url)
		doc = Nokogiri::HTML(html)
		stories = doc.css("div.featured_post")
		scraped_stories = stories.collect do |story|
			{:title => story.css(".card_headline").text}
		end
	end


end
