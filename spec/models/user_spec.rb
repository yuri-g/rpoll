require 'spec_helper'

describe User do
  let(:user) { create(:user) }
  let(:invalid_user) { build(:user, password: '', username: '', email: '') }

  describe '#vote' do
    let(:poll) { build(:poll) }
    context 'single choice' do
      it 'creates a vote' do
        options = [poll.options.first.id]
        user.vote(options, poll)
        expected_vote = Vote.new(user_id: user, poll_id: poll, option_id: options[0])
        new_vote = Votes.where(user_id: user, poll_id: poll, option_id: op)
        expect(new_vote).to eq(expected_vote)
      end
    end
  end

  describe 'creation' do

    context 'valid attributes' do
      it 'should be valid' do
        expect(user).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'should not be valid' do
        expect(invalid_user).to be_invalid
      end
    end

  end
end

