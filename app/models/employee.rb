class Employee < ApplicationRecord
  belongs_to :user
  validates :usname , presence: true
  validates :password , presence: true
  validates :user_id,presence: true
end
