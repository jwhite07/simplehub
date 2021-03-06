class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable,  :lockable
         
  validates_presence_of :first_name, :last_name, :organization, :user_role
  
  belongs_to :user_role
  belongs_to :organization
  accepts_nested_attributes_for :organization
end
