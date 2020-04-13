require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:balance) }
    it { should validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end
end
