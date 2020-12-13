class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # ユーザー情報
  with_options presence: true do
    validates :name
    validates :birthday
    # 本人情報
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ } do
      validates :family_name_kana
      validates :first_name_kana
    end
  end
  validates :email, uniqueness: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :password, confirmation: true
end
