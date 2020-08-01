class Merchant::DiscountsController < Merchant::BaseController
  def index
    @discounts = Discount.all
  end

  def show
    @discount = Discount.find(params[:id])
  end

  def new

  end

  def create
    merchant = current_user.merchant
    discount = merchant.discounts.new(discount_params)
    if discount.save
      redirect_to '/merchant/discounts'
    else
      generate_flash(discount)
      redirect_to '/merchant/discounts/new'
    end
  end

  private
  def discount_params
    params.permit(:name, :description, :percent_off, :minimum_quantity)
  end
end
