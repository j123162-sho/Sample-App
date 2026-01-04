class User < ApplicationRecord
<<<<<<< HEAD
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
=======
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
>>>>>>> dec308f1a6b9efc09a14dbe13a27dcf7014087e3
