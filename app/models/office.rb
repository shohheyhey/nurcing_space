class Office < ApplicationRecord
    has_secure_password
    validates :password_confirmation, presence: true
    validates :name, presence: true
    validates :email, presence: true
    validates :tell, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :adress, presence: true
    # validates :password, presence: true
end
