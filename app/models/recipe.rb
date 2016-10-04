class Recipe < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :courses
  has_many :preparations
  has_many :ingredients, through: :preparations
end
