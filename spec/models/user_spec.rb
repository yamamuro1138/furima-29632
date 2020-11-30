require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "新規登録がうまくいくとき" do
      it "全ての項目の入力が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "111aaa"
        @user.password_confirmation = "111aaa"
        expect(@user).to be_valid
      end
    end
      
      context '新規登録がうまくいかないとき' do
        it "nameが空だと登録できない" do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Name can't be blank")
        end
        it "emailが空では登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "重複したemailが空では登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空では登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが5文字以下であれば登録できない" do
          @user.password = "00000"
          @user.password_confirmation = "00000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordは半角英数字混合でないと登録できない" do
          @user.password = "aaaaaa"
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "family_nameがないと登録できない" do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        it "first_nameがないと登録できない" do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it "family_name_kanaがないと登録できない" do
          @user.family_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end
        it "first_name_kanaがないと登録できない" do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it "生年月日がないと登録できない" do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
  end
end
