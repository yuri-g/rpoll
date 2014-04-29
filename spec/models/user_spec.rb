require 'spec_helper'

describe User do
  let(:user) { create(:user) }
  let(:invalid_user) { build(:user, password: '', username: '', email: '') }

  describe '#vote' do
    let(:poll) { create(:poll) }
    let(:expected_vote) { create(:vote, poll: poll, user: user, option: poll.options.first) }

    context 'single choice' do
      it 'creates a vote' do
        options = [poll.options.first]
        votes = user.vote!(options, poll)
        expect(user.votes).to eq(votes)
      end
    end

    context 'when user already voted' do
      it 'returns false' do
        options = [poll.options.first]
        user.vote!(options, poll)
        vote_result = user.vote!(options, poll)
        expect(vote_result).to be false
      end
    end
  end

  describe '#voted?' do
    let!(:poll) { create(:poll) }
    let!(:vote) { create(:vote, poll: poll, user: user, option: poll.options.first) }
    let!(:unvoted_poll) { create(:poll) }

    context 'when user has voted' do
      it 'returns true' do
        expect(user.voted?(poll)).to be true
      end
    end

    context 'when user hasn\'t voted' do
      it 'returns false' do
        expect(user.voted?(unvoted_poll)).to be false
      end
    end
  end

  describe 'creation' do
    context 'with valid attributes' do
      it 'should be valid' do
        expect(user).to be_valid
      end
    end

    context 'with invalid attributes' do
      it 'should not be valid' do
        expect(invalid_user).to be_invalid
      end
    end

  end
end
