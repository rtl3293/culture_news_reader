class CultureNewsReader::Category

  attr_accessor :name, :articles
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
    @articles = []
  end

  def self.all
    @@all
  end

  def add_article(article)
    @articles << article
  end
end
