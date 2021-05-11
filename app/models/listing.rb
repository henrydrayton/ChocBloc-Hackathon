class Listing < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    validates :age, presence: true
    validates :description, presence: true
    has_one_attached :image
    belongs_to :user
end
