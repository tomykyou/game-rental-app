class Article < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :product_name, presence: true
  validates :image, presence: true
  validates :product_price, presence: true
  validates :platform, presence: true
  validates :product_company, presence: true
  validates :product_text, length: { minimum: 10 }
  has_many :comments, dependent: :destroy
end
