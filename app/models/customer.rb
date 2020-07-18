class Customer < ApplicationRecord
  belongs_to :office
  #   belongs_to :service
      has_many :customer_services, dependent: :destroy
      has_many :services, through: :customer_services
      belongs_to :category
      mount_uploader :image, ImageUploader
      validates :name, presence: true
      # validates :age, presence: true
      validates :birth, presence: true
      validates :adress, presence: true
      validates :kaigodo, presence: true
      validates :kioreki, presence: true
      validates :description, presence: true
end
