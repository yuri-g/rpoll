require 'spec_helper'

describe Poll do

  describe 'creation' do
    let(:poll) { create(:poll) }
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
