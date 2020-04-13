class Api::V1::AccountController < ApplicationController
  before_action :authenticate_user

  def deposit
    validate_deposit_params

    @user = current_user
    @user.deposit(deposit_params[:amount])
    render json: @user
  rescue => e
    render json: { error: e.to_s }, status: :unprocessable_entity
  end

  def withdraw
    validate_withdraw_params

    @user = current_user
    @user.withdraw(withdraw_params[:amount])
    render json: @user
  rescue => e
    render json: { error: e.to_s }, status: :unprocessable_entity
  end

  def transfer
    validate_transfer_params

    @to = User.find_by_email!(transfer_params[:email])    
    @from, = User.transfer(current_user, @to, transfer_params[:amount])
    render json: @from
  rescue => e
    render json: { error: e.to_s }, status: :unprocessable_entity
  end

  private
    def deposit_params
      params.permit(:amount)
    end

    def validate_deposit_params
      amount = deposit_params[:amount]
      
      raise 'Invalid amount' if (!amount.is_a? Numeric) || amount < 0
    end
    
    def withdraw_params
      params.permit(:amount)
    end

    def validate_withdraw_params
      amount = withdraw_params[:amount]
      
      raise 'Invalid amount' if (!amount.is_a? Numeric) || amount < 0
    end

    def transfer_params
      params.permit(:email, :amount)
    end

    def validate_transfer_params
      email = transfer_params[:email]
      amount = transfer_params[:amount]
      
      raise 'Invalid email' unless email =~ URI::MailTo::EMAIL_REGEXP
      raise 'Invalid amount' if (!amount.is_a? Numeric) || amount < 0
    end    
end
