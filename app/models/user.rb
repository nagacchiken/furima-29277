class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :family_name,:first_name,:family_name_kana,:first_name_kana,:birthday, presence: true
  validates :email, uniqueness: true
  validates :email, inclusion: { in: ["@"]}
  validates :password, length:{minimum: 6}
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :family_name,:first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :family_name_kana,:first_name_kana,format: { with: /\A[ァ-ン]+\z/ }
end
