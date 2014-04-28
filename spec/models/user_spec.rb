require 'spec_helper'

describe User do

  describe 'creation' do
    let(:user) { build(:user) }
    let(:invalid_user) { build(:user, password: '', username: '', email: '') }

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

