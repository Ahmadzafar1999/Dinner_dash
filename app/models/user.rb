# frozen_string_literal: true

# This is the user model
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart, dependent: :destroy
  has_many :orders
  enum user_type: %i[customer admin]
  validates :user_type, inclusion: { in: %w[customer admin] }
  validates :email, :user_type, :password, :full_name, presence: true
  validates_uniqueness_of :email, :user_name
  validates_length_of :user_name, in: 2..32

  scope :admin, -> { where(user_type: user_type[:admin]) }
  scope :customer, -> { where(user_type: user_type[:customer]) }
end
