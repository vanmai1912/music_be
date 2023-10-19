class Singer < ApplicationRecord
  enum genre: { nam: false, nu: true }
  has_many :songs
  has_one_attached :avatar
end
