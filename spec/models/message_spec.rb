require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ投稿' do
    context "メッセージ投稿できる時" do
      it "メッセージが存在すれば投稿できること" do
        expect(@message).to be_valid
      end
    end

    context "メッセージ投稿できない時" do
      it "メッセージが存在しなければ投稿できないこと" do
        @message.message = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("Message が空になっています")
      end
 
      it "roomが存在しなければ投稿できないこと" do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room が存在しません")
      end

      it "userが存在しなければ投稿できないこと" do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User が存在しません")
      end
    end
  end 
end