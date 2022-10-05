class Profile < ApplicationRecord

  has_many :repositories, dependent: :destroy
  #VALIDATIONS
  validates :username,  
            presence: true,
            length: {maximum: 255},
            uniqueness: true,
            format: { with: /\A(?=.*[a-z])[a-z-\d]+\Z/i }
end
