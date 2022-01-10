class Recipe
  attr_accessor :title, :chef, :ingredients, :prep_time, :directions, :image_url
  
  def initialize(options)
    @title = options[:title]
    @chef = options[:chef]
    @ingredients = options[:ingredients]
    @prep_time = options[:prep_time]
    @directions = options[:directions]
    @image_url = options[:image_url]
  end
end