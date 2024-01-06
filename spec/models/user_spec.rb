require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    %i[email first_name last_name encrypted_password].each do |field|
      it { is_expected.to validate_presence_of(field) }
    end
  end

  subject(:user) { FactoryBot.create(:user) }

  describe '#create' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
