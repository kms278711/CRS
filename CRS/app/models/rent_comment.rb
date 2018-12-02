class RentComment < ApplicationRecord
  belongs_to :rent_post
  belongs_to :user
end
