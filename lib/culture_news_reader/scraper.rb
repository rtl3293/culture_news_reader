

class Scraper

	def self.scrape_music_page(music_url)
		html = open(music_url)
		doc = Nokogiri::HTML(html)
	end

	def self.scrape_style_page(style_url)
		html = open(style_url)
		doc = Nokogiri::HTML(html)
	end

	def self.scrape_culture_page(culture_url)
		html = open(culture_url)
		doc = Nokogiri::HTML(html)
	end

end
