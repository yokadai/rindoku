require 'rails_helper'

RSpec.describe "Users", type: :system do
  it "非ログイン時、チャットページにアクセスした場合、ログインページへ遷移" do
    # チャットページへ移動する
    visit messages_index2_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq(new_user_session_path)
  end

  it "ログイン成功後、トップページへ遷移" do
    @user = FactoryBot.create(:user)

    # サインインページへ移動する
    visit  new_user_session_path

    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq(new_user_session_path)

    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password

    # ログインボタンをクリックする
    click_on('Log in')

    # トップページに遷移していることを確認する
    expect(current_path).to eq(root_path)
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
 
    # サインインページへ移動する
    visit  new_user_session_path

    # 誤ったユーザー情報を入力する
    fill_in 'user_email', with: 'miss'
    fill_in 'user_password', with: 'false'

    # ログインボタンをクリックする
    click_on('Log in')

    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq(new_user_session_path)
  end
end
