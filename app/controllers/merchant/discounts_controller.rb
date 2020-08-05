class Merchant::DiscountsController < Merchant::BaseController
  def index
    @discounts = Discount.all
  end

  def show
    @discount = Discount.find(params[:id])
    @merchant = current_user.merchant
  end

  def new
  end

  def create
    merchant = current_user.merchant
    discount = merchant.discounts.new(discount_params)
    if discount.save
      redirect_to '/merchant/discounts'
    else
    flash[:error] = "Form incomplete. Please fill out all fields"
      redirect_to '/merchant/discounts/new'
    end
  end

  def edit
    @discount = Discount.find(params[:id])
  end

  def update
    @discount = Discount.find(params[:id])
    if @discount.update(discount_params)
      redirect_to "/merchant/discounts/#{@discount.id}"
    else
      redirect_to "/merchant/discounts/#{@discount.id}/edit"
    end
  end

  def destroy
    discount = Discount.find(params[:id])
    discount.destroy
    flash[:notice] = "Discount has been deleted"
    redirect_to "/merchant/discounts"
  end

  private
  def discount_params
    params.permit(:name, :description, :percent_off, :minimum_quantity)
  end
end
