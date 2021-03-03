require 'rails_helper'

RSpec.describe "Messages", type: :system do
  before do
    @user_room = FactoryBot.create(:user_room)
  end

  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
      # サインインする
      sign_in(@user_room.user)

      # 投稿ページに移行する
      visit messages_index2_path

      # 作成されたチャットルームへ遷移する
      click_on(@user_room.room.room_name)

      # 値をテキストフォームに入力する
      post = '投稿'
      fill_in 'message_message', with: post

      # 送信した値がDBに保存されていることを確認する
      expect {
        find('input[name="commit"]').click
      }.to change { Message.count }.by(1)

      # 投稿一覧画面に遷移していることを確認する
      expect(current_path).to eq(room_messages_path(@user_room.room))

      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(post)
    end
  end

  context '投稿に失敗したとき' do
    it '送る値が空の場合、メッセージの送信に失敗すること' do
      # サインインする
      sign_in(@user_room.user)

      # 投稿ページに移行する
      visit messages_index2_path

      # 作成されたチャットルームへ遷移する
      click_on(@user_room.room.room_name)

      # DBに保存されていないことを確認する
      expect {
        find('input[name="commit"]').click
      }.not_to change { Message.count }

      # 元のページに戻ってくることを確認する
      expect(current_path).to eq(room_messages_path(@user_room.room))
    end
  end
end
