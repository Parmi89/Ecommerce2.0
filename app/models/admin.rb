class Admin < ApplicationRecord
  include Login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :validatable, authentication_keys: [:login]


  has_many :products, dependent: :destroy 


  
end
