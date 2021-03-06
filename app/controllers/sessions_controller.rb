# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'Successfully logged in!'
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination'
      # render 'new'
      redirect_to root_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
