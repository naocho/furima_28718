require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "カラムが全て存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "メールアドレスが＠を含み一意性が必要がある。" do
        @user.email = "sample831@gmail.com"
        expect(@user).to be_valid
      end
      it "passwordが６文字以上であり半角英数字混合であればれば登録できる" do
        @user.password = "sample0831"
        @user.password_confirmation = "sample0831"
        expect(@user).to be_valid
      end
      it "苗字は全角（漢字、平仮名、カタカナ）で入力" do
        @user.name = "伏見"
        expect(@user).to be_valid
      end
      it "名前は全角（漢字、平仮名、カタカナ）で入力" do
        @user.surname = "直樹"
        expect(@user).to be_valid
      end
      it "苗字の振り仮名は全角（カタカナ）で入力" do
        @user.kana_name = "フシミ"
        expect(@user).to be_valid
      end
      it "名前の振り仮名は全角（カタカナ）で入力" do
        @user.kana_surname = "ナオキ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいくとき' do
  
      #エラーコードについては一度エラーを出してからexpected ["ここをincludeにかく"]
      it "ニックネームが必須であること" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "メールアドレスが必須であること" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "メールアドレスは@を含む必要がある" do
        @user.email = 'syou831gmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email @を含めてください")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "パスワードが必須であること" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "abe31"
        @user.password_confirmation = "abe31"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードが半角英数字混合でなければ登録出来ない。" do
        @user.password = "00000000"
        @user.password_confirmation = "00000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字混合で6文字以上使用してください")
      end

      it "パスワードは確認用を含めて2回入力すること" do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字混合で6文字以上使用してください")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "苗字は全角（漢字、平仮名、カタカナ）で入力しなければ登録出来ない。" do
        @user.name = 'mame'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name 全角文字を使用してください")
      end

      it "名前は全角（漢字、平仮名、カタカナ）で入力しなければ登録出来ない。" do
        @user.surname = 'mame'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname 全角文字を使用してください")
      end

      it "苗字の振り仮名は全角（カタカナ）で入力しなければ登録出来ない。" do
        @user.kana_name = 'ふしみ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana name 全角文字を使用してください")
      end

      it "名前の振り仮名は全角（カタカナ）で入力しなければ登録出来ない。" do
        @user.kana_surname = 'なおき'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana surname 全角文字を使用してください")
      end
    end
  end
end