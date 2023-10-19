class Song < ApplicationRecord
  belongs_to :type
  belongs_to :singer
  has_one_attached :audio

end
