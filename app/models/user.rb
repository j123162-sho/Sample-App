class User < ApplicationRecord
  # メールアドレスを小文字にする設定
  before_save { self.email = email.downcase }
  
  # 名前のルール（必須、50文字以下）
  validates :name,  presence: true, length: { maximum: 50 }
  
  # メールアドレスのフォーマット定義
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  # メールアドレスのルール（必須、255文字以下、フォーマット、一意性）
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  # パスワードの機能を追加
  has_secure_password
  
  # パスワードのルール（必須、6文字以上）
  validates :password, presence: true, length: { minimum: 6 }
end