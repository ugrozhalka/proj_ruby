class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :login, presence: true
  has_secure_password :password, validations: true
  has_many :wishes, dependent: :destroy

  has_many :created_wishes, class_name: 'Wish', foreign_key: 'user_id'
  has_many :fulfillments, foreign_key: 'creator_id'
  has_many :fulfilled_wishes, through: :fulfillments, source: :wish

  has_many :fulfillments_as_creator, class_name: 'Fulfillment', foreign_key: 'creator_id'
  has_many :fulfillments_as_performer, class_name: 'Fulfillment', foreign_key: 'performer_id'
  has_many :fulfilled_wishes_as_creator, through: :fulfillments_as_creator, source: :wish
  has_many :fulfilled_wishes_as_performer, through: :fulfillments_as_performer, source: :wish

  def destroy
    super
  end
end
