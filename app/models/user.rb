class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :nickname, :birth_day, :first_name, :last_name, :first_name_reading, :last_name_reading
  validates :email, uniqueness: { case_sensitive: true }
end
