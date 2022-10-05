class Repository < ApplicationRecord

  belongs_to :profile, inverse_of: :repositories
end
