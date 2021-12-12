class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :avatar
         
         validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
         validates :name, presence: true, length: {   in:6..30 }
         validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 6, less_than_or_equal_to:150 }
end
