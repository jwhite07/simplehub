class Organization < ApplicationRecord
  validates_presence_of :name
  has_many :users, dependent: :destroy
  has_many :dashboards, dependent: :destroy
  has_many :integrations, dependent: :destroy
end
