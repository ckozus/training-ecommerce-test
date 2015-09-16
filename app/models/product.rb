class Product < ActiveRecord::Base

  belongs_to :brand

  has_and_belongs_to_many :category

  validates :name, presence: true, length: {minimum: 10}
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :code, presence: true, uniqueness: true

end
