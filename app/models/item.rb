class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  with_options presence: true do
    validates :name, length: { minimum: 1, maximum: 40 }
    validates :introduction, length: { minimum: 1, maximum: 1000 }
    validates :condition
    validates :area
    validates :price, numericality: { only_integer: true , greater_than: 299, less_than: 10000000 }
    validates :preparation_day
    validates :postage
    validates :images
  end
  validates_associated :images

end
