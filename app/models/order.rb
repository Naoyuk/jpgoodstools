# frozen_string_literal: true

class Order < ApplicationRecord
  validates :order_number, presence: true
  validates :order_date, presence: true

  belongs_to :customer, optional: true
  has_many :lists, dependent: :destroy

  def self.total_order
    sum(:total)
  end

  def total
    sum = 0
    lists.each { |li| sum += li.list_price * li.amount }
    sum
  end
end
