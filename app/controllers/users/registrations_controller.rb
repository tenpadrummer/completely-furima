# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :session_has_not_user_data, only: [:new_user_info, :create_user_info] #直打ち対策

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

  def session_has_not_user_data
    redirect_to root_path, alert: "ユーザー情報が登録されていません" unless session["devise.regist_data"]
  end
end
