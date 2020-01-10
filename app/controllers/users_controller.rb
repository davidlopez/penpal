class UsersController < ApplicationController
  before_action :logged_in?, :survey_not_completed?, except: :create

  def create
    user = User.find_by(email: email)
    user ? found_user_redirect(user) : setup_new_user
  end

  def show; end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      flash[:success] = 'Profile Updated!'
      redirect_to '/profile'
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    current_user.destroy
    session.clear
    flash[:notice] = 'Account deleted.'
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end

    def found_user_redirect(user)
      session[:user_id] = user.id
      redirect_to landing_path
      flash[:success] = 'Login Successful'
    end

    def setup_new_user
      user = make_user
      user.save ? new_user_redirect(user) : failed_user_redirect
    end

    def make_user
      User.new(
        first_name: first_name,
        last_name: last_name,
        email: email,
        google_token: token
      )
    end

    def new_user_redirect(user)
      session[:user_id] = user.id
      flash[:success] = 'Login Successful'
      redirect_to survey_path
    end

    def failed_user_redirect
      flash[:error] = 'Failed to Login'
      redirect_to '/'
    end

    def first_name
      f_name = request.env['omniauth.auth']['info']
      f_name ? f_name['first_name'] : nil
    end

    def last_name
      l_name = request.env['omniauth.auth']['info']
      l_name ? l_name['last_name'] : nil
    end

    def email
      email = request.env['omniauth.auth']['info']
      email ? email['email'] : nil
    end

    def token
      token = request.env['omniauth.auth']['credentials']
      token ? token['token'] : nil
    end
end
