class Product < ActiveRecord::Base

  belongs_to :brand

  has_and_belongs_to_many :category

  validates :name, presence: true, length: {minimum: 10}
  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :code, presence: true, uniqueness: true

  has_attached_file :image, styles: { medium: "192x203>" }, default_url: "/images/missing/:style.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
