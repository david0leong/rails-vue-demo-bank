require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('email@addresse.foo').for(:email) }
    it { should_not allow_value('foo').for(:email) }

    it { should validate_presence_of(:balance) }
    it { should validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end

  describe '#deposit' do
    subject { create(:user, { balance: 100 }) }
    
    it 'raise exception when amount is invalid' do
      expect { subject.deposit(-1) }.to raise_error('Invalid amount')
      expect { subject.deposit('abc') }.to raise_error('Invalid amount')
    end

    it 'should deposit money to user account' do
      subject.deposit(100)

      expect(subject.balance).to eq(200)
    end
  end

  describe '#withdraw' do
    subject { create(:user, { balance: 100 }) }
    
    it 'raise exception when amount is invalid' do
      expect { subject.withdraw(-1) }.to raise_error('Invalid amount')
      expect { subject.withdraw('abc') }.to raise_error('Invalid amount')
    end

    it 'raise exception when amount is larger than balance' do
      expect { subject.withdraw(101) }.to raise_error

      subject.reload

      expect(subject.balance).to eq(100)
    end

    it 'should withdraw money from user account' do
      subject.withdraw(100)

      expect(subject.balance).to eq(0)
    end
  end

  describe '.transfer' do
    let(:from) { create(:user, { balance: 100 }) }
    let(:to) { create(:user, { balance: 200 }) }
    
    it 'should raise exception when amount is invalid' do
      expect { User.transfer(from, to, -1) }.to raise_error('Invalid amount')
      expect { User.transfer(from, to, 'abc') }.to raise_error('Invalid amount')
    end

    it 'should do nothing when one account gets invalid after transaction' do
      expect { User.transfer(from, to, 101) }.to raise_error

      from.reload
      to.reload

      expect(from.balance).to eq(100)
      expect(to.balance).to eq(200)
    end

    it 'should transfer money from source account to destination account' do
      User.transfer(from, to, 50)

      from.reload
      to.reload

      expect(from.balance).to eq(50)
      expect(to.balance).to eq(250)
    end
  end
end
