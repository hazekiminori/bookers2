class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :books, dependent: :destroy
  
  has_one_attached :profile_image

  validates :name, {length: {in: 2..20} }

  validates :name, uniqueness: true

  validates :introduction, {length: {maximum: 50}}

 def get_profile_image
    if profile_image.attached?
      profile_image
    else
      'no_image.jpg'
    end
end
end
