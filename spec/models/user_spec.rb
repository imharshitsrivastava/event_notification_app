require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }

    it 'should validate the format of password' do
      user = User.new(email:"Test@email.com", first_name: "first_test", last_name: "last_test", password: 'password', password_confirmation: 'password')
      user.valid?
      expect(user.errors[:password]).to include('contains both upper and lower case character, at least one numeric character and at least one special character (need minimum is 8 characters)')

      user.password = 'Test@123'
      user.password_confirmation = 'Test@123'
      expect(user.valid?).to be_truthy
    end
  end

  describe 'associations' do
    it { should have_many(:events).class_name('Event') }
  end
end
