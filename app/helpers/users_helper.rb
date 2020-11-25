module UsersHelper

  def sum_price
    sum_price = @user.items.pluck(:price).sum
  end
end
