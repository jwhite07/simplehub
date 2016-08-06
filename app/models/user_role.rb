class UserRole < ApplicationRecord
  validates_presence_of :title
  has_many :users
end
