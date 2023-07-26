require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:street_address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip) }


  describe 'password encryption' do
    it 'should have secure password enabled' do
      user = User.new(name: 'Example', email: 'test@example.com', password: 'password', password_confirmation: 'password', street_address: '123 elm st', city: 'Austin', state: 'TX', zip: 77777)
      expect(user.password_digest).not_to eq 'password'
    end
  end
end
