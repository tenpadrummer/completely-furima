class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #英数字、アンダースコア (_)、プラス (+)、ハイフン (-)、ドット (.) のいずれかを少なくとも1文字以上繰り返す,@マーク, 英小文字、数字、ハイフン、ドットのいずれかを少なくとも1文字以上繰り返す、ドット, 	英小文字を少なくとも1文字以上繰り返す
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # 半角英数字をそれぞれ1種類以上含む正規表現
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
  # 全角ひらがな、全角カタカナ、漢字
  JAPANESE_REGEX = /\A[ぁ-んァ-ン一-龥]/
  # 全角カタカナ
  FULL_WIDTH_REGEX = /\A[ァ-ヶー－]+\z/

  validates_presence_of :nickname, :birth_day, :first_name, :last_name, :first_name_reading, :last_name_reading
  validates :email, uniqueness: { case_sensitive: true }, format: { with: EMAIL_REGEX }
  validates :password, length: {minimum: 6}, format: { with: PASSWORD_REGEX }
  validates :first_name, :last_name, format: { with: JAPANESE_REGEX}
  validates :first_name_reading, :last_name_reading, format: {with: FULL_WIDTH_REGEX }

  has_many :items, dependent: :destroy
end
