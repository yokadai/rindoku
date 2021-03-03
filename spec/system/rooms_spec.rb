require 'rails_helper'

RSpec.describe "Rooms", type: :system do
  before do
    @user_room = FactoryBot.create(:user_room)
  end

  it 'チャットルームを削除すると、関連するメッセージがすべて削除されていること' do
    # サインインする
    sign_in(@user_room.user)

    # チャットページへ遷移する
    visit messages_index2_path

    # 作成されたチャットルームへ遷移する
    click_on(@user_room.room.room_name)

    # メッセージ情報を5つDBに追加する
    FactoryBot.create_list(:message, 5, room_id: @user_room.room.id, user_id: @user_room.user.id)

    # 「輪読を終了する」ボタンをクリックすることで、作成した5つのメッセージが削除されていることを確認する
    expect {
      find_link('輪読を終了する',  href: room_path(@user_room.room)).click
    }.to change { @user_room.room.messages.count }.by(-5)

    # トップページに遷移していることを確認する
    expect(current_path).to eq(messages_index2_path)
  end
end
