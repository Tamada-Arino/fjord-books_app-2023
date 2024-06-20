class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_POST_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/

  validates :name, presence: true, length: { maximum: 50 }
  validates :introduction, length: { maximum: 200 }
  validates :post_code, format: { with: VALID_POST_CODE_REGEX }, allow_blank: true
end
