class User < ApplicationRecord
  validates :nick_name, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :last_name, presence: true, format: { with: /\A[ぁ-ん一-龥々]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-ん一-龥々]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :records, dependent: :destroy

end
