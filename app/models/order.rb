# frozen_string_literal: true

# This is the model for dealing with orders of users
class Order < ApplicationRecord
  belongs_to :user
  has_many :lineItems
  enum status: %i[ordered paid cancelled completed]
  validates :status, inclusion: { in: %w[ordered paid cancelled completed] }
  validates :total, numericality: { greater_than: 0 }
  validate :time_stamp, :not_in_past

  private

  def not_in_past
    errors.add(:date, 'in past') if time_stamp < (Time.now - 1.minutes)
  end
end
