class Review < ApplicationRecord
  belongs_to :restaurant

  # Validations
  validates :rating, presence: true,
                     inclusion: 0..5,
                     numericality: { only_integer: true }
  validates :content, presence: true
  # helper when your model has associations with other models
  # and they also need to be validated
  validates_associated :restaurant
end
