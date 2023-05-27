require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it 'validates the length of password' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it { should validate_confirmation_of(:password).on(:create) }
  end

  describe 'associations' do
    it { should have_many(:foods).dependent(:destroy) }
    it { should have_many(:recipes).dependent(:destroy) }
  end
end
