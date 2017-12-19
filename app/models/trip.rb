class Trip < ApplicationRecord
  validates_presence_of :name
  has_many :routes
  has_many :destinations, through: :routes
  belongs_to :user
end
