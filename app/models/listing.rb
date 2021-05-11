class Listing < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    validates :age, presence: true
    validates :description, presence: true
    belongs_to :user
end
