class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name,
                        :description,
                        :percent_off,
                        :minimum_quantity

  def date_created
    created_at.strftime("%d %B %Y")
  end

  # def apply_discount?(item_count)
  #    minimum_quantity <= item
  # end
  #
  # def discount(item)
  #   require "pry"; binding.pry
  # end
end





# def total_count_it_been_applied
#   require "pry"; binding.pry
#   count
# end
