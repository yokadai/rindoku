require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  it "ルーム名が存在すればルーム作成できること" do
    expect(@room).to be_valid
  end

  it "ルーム名が存在しなければルーム作成できないこと" do
    @room.room_name = ""
    @room.valid?
    expect(@room.errors.full_messages).to include("Room name can't be blank")
  end
end
