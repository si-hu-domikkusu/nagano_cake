class Item < ApplicationRecord


  before_save :set_tax_price
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  attachment :image

  private

  def set_tax_price
    price * 1.10
  end


end
