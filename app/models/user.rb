class User < ApplicationRecord
  include Login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :validatable, authentication_keys: [:login]

  
  has_one :info_user, dependent: :destroy
  after_create :create_info_user_with_same_id

  private

  def create_info_user_with_same_id
    # Crear un InfoUser asociado a este usuario con el mismo id
    build_info_user(id: id).save!
  end
  
end


