class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
    @contents.default = 0
  end

  def add_item(item_id)
    @contents[item_id] += 1
  end

  def less_item(item_id)
    @contents[item_id] -= 1
  end

  def count
    @contents.values.sum
  end

  def items
    @contents.map do |item_id, _|
      Item.find(item_id)
    end
  end

  def grand_total
    grand_total = 0.0
    @contents.each do |item_id, quantity|
      grand_total += Item.find(item_id).price * quantity
    end
    grand_total
  end

  def count_of(item_id)
    @contents[item_id.to_s]
  end

  def subtotal_of(item_id)
    subtotal = nil
    item = Item.find(item_id)
    discounts = Discount.all.find_all do |discount|
      discount.merchant_id == item.merchant_id
    end
    # ORDER DISCOUNTS FROM LARGEST TO SMALLEST QUANTITY
    discounts.sort_by!(&:minimum_quantity).reverse!
    discounts.each do |discount|
      if count_of(item_id) >= discount.minimum_quantity
        price_before_discount = count_of(item_id) * item.price
        percent_float = discount.percent_off.to_f / 100
        subtotal = price_before_discount - (price_before_discount * percent_float)
        break
      else
        subtotal = count_of(item_id) * item.price
      end
    end
    subtotal
  end

  def limit_reached?(item_id)
    count_of(item_id) == Item.find(item_id).inventory
  end
end
