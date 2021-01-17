class User < ApplicationRecord

  with_options presence: true do
    validates :nick_name
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
      with_options format: { with: /\A[ぁ-ん一-龥々]+\z/ } do
        validates :last_name
        validates :first_name
      end
      with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
        validates :last_name_kana
        validates :first_name_kana
      end
    validates :birthday
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  #has_many :records, dependent: :destroy

end
