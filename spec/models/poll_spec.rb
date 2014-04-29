require 'spec_helper'

describe Poll do
  let(:user) { create(:user) }
  let(:poll) { create(:poll, multiple_options: true) }
  let(:multiple_options) { poll.options.to_a }

  describe '#results' do
    context 'user has voted for two options' do
      it 'returns results array' do
        votes = user.vote!(multiple_options, poll)
        results = poll.results
        expect(results).to eq([{name: 'option1', votes: 1, percentage: 50},
                               {name: 'option2', votes: 1, percentage: 50}])
      end
    end

    context 'no one has voted yet' do
      it 'returns 0 percentage (no division by zero)' do
        results = poll.results
        expect(results).to eq([{name: 'option1', votes: 0, percentage: 0},
                               {name: 'option2', votes: 0, percentage: 0}])
      end
    end

    context 'two users voted' do
      it 'returns results array' do
        user2 = create(:user, email: 'user2@mail.com', username: 'user2')
        user.vote!(multiple_options, poll)
        user2.vote!([multiple_options[0]], poll)
        results = poll.results
        expect(results).to eq([{name: 'option1', votes: 2, percentage: 66.67},
                               {name: 'option2', votes: 1, percentage: 33.33}])
      end
    end
  end

  describe 'creation' do
    let(:empty_poll) { build(:poll, options: [], name: '') }

    context 'valid attributes' do
      it 'should be valid' do
        expect(poll).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'should not be valid' do
        expect(empty_poll).to be_invalid
      end
    end
  end
end
