class User < ApplicationRecord
  after_initialize :default_values

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.transfer(from, to, amount)
    raise 'Cannot transfer to yourself' if from.email == to.email

    User.transaction do
      from.withdraw(amount)
      to.deposit(amount)
    end

    [from, to]
  end

  def withdraw(amount)
    validate_amount(amount)

    update!(balance: balance - amount)
  end

  def deposit(amount)
    validate_amount(amount)

    update!(balance: balance + amount)
  end

  def to_token_payload
    { sub: id }
  end

  private

    def validate_amount(amount)
      raise 'Invalid amount' if (!amount.is_a? Numeric) || amount < 0
    end

    def default_values
      self.balance = 0 if self.balance.nil?
    end
end
