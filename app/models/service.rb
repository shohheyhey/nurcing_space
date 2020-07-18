class Service < ApplicationRecord
  # belongs_to :office
  belongs_to :category
  has_many :customer_services, dependent: :destroy
  has_many :customers, through: :customer_services
  accepts_nested_attributes_for :customer_services
  validates :name, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
end
