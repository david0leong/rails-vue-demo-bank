class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.transfer_money(from, to, amount)
    User.transaction do
      from.withdraw(amount)
      to.deposit(amount)
    end

    [from, to]
  end

  def withdraw(amount)
    validate_amount(amount)

    self.update!(balance: self.balance - amount)
  end

  def deposit(amount)
    validate_amount(amount)

    self.update!(balance: self.balance + amount)
  end

  private

  def validate_amount(amount)
    raise 'Invalid amount' if (!amount.is_a? Numeric) || amount < 0
  end
end