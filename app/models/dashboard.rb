class Dashboard < ApplicationRecord
  belongs_to :organization
  validates_presence_of :title, :organization
  has_many :widgets, inverse_of: :dashboard, dependent: :destroy
  accepts_nested_attributes_for :widgets
end
