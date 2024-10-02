class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :rents

  validates :name, presence: true
  validates :amount, presence: true
  validates :address, presence: true
  validates :image, presence: true

  def rents_new
    rents.new
  end
end
