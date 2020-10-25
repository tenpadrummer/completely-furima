# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  def create
    @user = User.new(sign_up_params) #deviseの仕様。configure_sign_up_paramsなのにsign_up_paramsで呼び出せている。
    unless @user.valid?
      render :new and return # and returnと記述することで処理を中断
    end
    session["devise.regist_data"] = {user: @user.attributes} # attributesメソッドで@userの属性値をハッシュで取得
    session["devise.regist_data"][:user]["password"] = params[:user][:password] # passwordは@user.attributesに含まないためparamsから別途取得
    @user_info = @user.build_user_info # @userに紐づく変数をビューで使用するため定義
    render :new_user_info
  end

  def create_user_info
    @user = User.new(session["devise.regist_data"]["user"]) # sessionに入っているuserの情報を元に@userを再定義
    @user_info = UserInfo.new(user_info_params) # @user_infoを定義
    @user.build_user_info(@user_info.attributes) # @address_presetと@userを紐づけ
    unless @user.valid?
      render :new_user_info and return # and returnと記述することで処理を中断
    end
    @user.save #保存
    session["devise.regist_data"]["user"].clear #sessionを削除
    sign_in(:user, @user) #ログイン
  end

  private

  def user_info_params
    params.require(:user_info).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
