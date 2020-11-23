class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_category
    @categories = Category.all
  end

  def set_brand
    @brands = Brand.all
  end

  def search_item
    @i = Item.ransack(params[:q])
    # キー（:q）を使用し、itemsテーブルから商品情報を探す。
    # そして、「@i」という名前の検索オブジェクトを生成。
  end

  def search_category
    @c = Item.ransack(params[:q])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :birth_day, :first_name, :last_name, :first_name_reading, :last_name_reading])
  end
end
