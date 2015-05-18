class Annonce < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	geocoded_by :address
  after_validation :geocode
 
  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("description like ?", "%#{query}%") 
  end
end