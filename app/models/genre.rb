class Genre < ApplicationRecord

  validates :name, presence: true
  validates :name, length: { maximum: 20 }

end
