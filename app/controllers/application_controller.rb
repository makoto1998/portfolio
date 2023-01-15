class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end
  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    user_path('show')
  end

  def show
    @user = User.find(params[:id])
    @user = current_user
  end



  protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :name, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :encrypted_password, :name, :image, :profile])
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :name, :image])
  end

end
