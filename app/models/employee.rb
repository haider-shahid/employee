class Employee < ApplicationRecord
  validates :usname , presence: true
  validates :password , presence: true
end
