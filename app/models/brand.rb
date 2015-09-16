class Brand < ActiveRecord::Base
  has_many :products

  validates :name, presence: true

  def pretty_name
    " * * * #{name} * * *"
  end
end
