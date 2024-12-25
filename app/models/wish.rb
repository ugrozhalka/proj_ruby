class Wish < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  has_one :fulfillment
  def destroy
    super
  end
end
