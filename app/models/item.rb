class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :user, optional: true

  accepts_nested_attributes_for :brand
end
