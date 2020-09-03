class User < ApplicationRecord
  has_many :furimas
  # has_many :purchases
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #:validatableはパスワードとemailのバリデーションを紐付く記述

  with_options presence: true do 
    #with_optionsはそのあとのpresence: true（記述があればtrue） doをendまで全体に効果を反映させる記述
    validates :nickname
    validates :password,      format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/, message: '半角英数字混合で6文字以上使用してください'}
    #データベースを超えるまではパスワードの記述はpasswordであり、データベースを超えたあとの記述はencrypted_passwordである
    validates :email,         format: { with: /\A.+@.+\z/, message: '@を含めてください'}
    validates :name,          format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください'}
    validates :kana_name,     format: { with: /\A[ァ-ヶー－]+\z/, message: '全角文字を使用してください'}
    validates :surname,       format: { with: /\A[ぁ-んァ-ン一-龥]+\z/,message: '全角文字を使用してください'}
    validates :kana_surname , format: { with: /\A[ァ-ヶー－]+\z/, message: '全角文字を使用してください'}
    validates :birthday       #,message: '全角文字を使用してください'
  end
  # validatesで指定の文以外を記入の場合はテーブルに記録されなくなる。
end
