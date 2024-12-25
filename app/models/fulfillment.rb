class Fulfillment < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :performer, class_name: 'User'
  belongs_to :wish
end
