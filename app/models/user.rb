class User < ApplicationRecord
  validates :username, presence: true, uniqueness: {case_sensitive: false} , length: {minimum: 3,maximum: 20}
  VALID_EMAIL_REGEX = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}/i
   validates :email, presence: true,uniqueness: {case_sensitive: false}, length: {minimum: 5,maximum: 50},
              format: {with: VALID_EMAIL_REGEX}
end