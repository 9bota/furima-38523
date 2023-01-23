class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  #ニックネームが必須であること
  validates :nickname, presence: true

  #メールアドレスが必須であること → devise標準実装のため省略
  #メールアドレスが一意生であること → devise標準実装のため省略
  #パスワードが必須であること → devise標準実装のため省略
  #パスワードが＠を含む必要があること → devise標準実装のため省略
  #パスワードは６字以上入力が必須であること → devise標準実装のため省略

  #パスワードは半角英数字混合での入力が必須であること
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  # パスワードとパスワード（確認）の値が一緒であること → devise標準実装のため省略
  # 名前（全角）は名字・名前がそれぞれ必須であること
  # 名前（全角）は全角（漢字・ひらがな・カタカナ）での入力が必須であること
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  # 名前カナ（全角）は名字・名前がそれぞれ必須であること
  # 名前カナ（全角）は全角（カタカナ）での入力が必須であること
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  #生年月日が必須であること
  validates :birthday ,presence: true
end
