class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :description, presence: true
  validates :description, length: { in: 10..500 }



belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
    
  # end
has_many :images
has_many :carted_products
has_many :orders, through: :carted_products
  # def imagess
  #   Image.where(product_id: self.id)
    
  # end
  has_many :product_categories
  has_many :categories, through: :products_categories

  # def categories
  #   product_categories.map { |product_category| product_category.category }
  # end



  def is_discounted?
    price < 10
  end

  def tax
    price  * 0.09
  end

  def total
     price + tax
  end
end






