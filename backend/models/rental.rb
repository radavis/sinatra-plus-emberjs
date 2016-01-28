class Rental < ActiveRecord::Base
  validates :title, presence: true
  validates :city, presence: true
  validates :bedrooms, numericality: true
end
