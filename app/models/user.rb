class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true

  # パスワードのバリデーション
  VALID_PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/.freeze
  validates :password,
            presence: true,
            length: { minimum: 6 },
            format: { with: VALID_PASSWORD_REGEX }

  # 苗字名前のバリデーション
  VALID_NAME_REGEX = /\A([ぁ-んァ-ン一-龥]|ー)+$\Z/.freeze
  validates :first_name, :last_name,
            presence: true,
            format: { with: VALID_NAME_REGEX }

  # 苗字名前カナのバリデーション
  VALID_NAMEKANA_REGEX = /\A([ァ-ン]|ー)+$\Z/.freeze
  validates :first_name_kana, :last_name_kana,
            presence: true,
            format: { with: VALID_NAMEKANA_REGEX }

  has_many :items
  has_many :buy_records
end
