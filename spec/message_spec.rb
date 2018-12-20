require_relative '../lib/message'

RSpec.describe 'Message' do
  context "fill in message with test1" do
    let(:message) { Message.new("test1") }
    before do
      Timecop.freeze
    end
    it "will return a message" do
      expect(message.msg).to eq "test1"
    end

    it "will return a timestamp" do
      expect(message.time).to eq Time.now
    end

    it "will return a id" do
      expect(message.id).to eq Time.now.to_i
    end
  end
  context "over 20 characters message" do
    let(:message) { Message.new("abcdefghijklmnopqrstuvwxyz") }
    it "will return a title below 20 characters" do
      expect(message.title.length).to eq 20
    end
  end
end
