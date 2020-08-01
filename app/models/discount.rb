class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name,
                        :description,
                        :percent_off,
                        :minimum_quantity

  def date_created
    created_at.strftime("%d %B %Y")
  end

  # def total_count_it_been_applied
  #   require "pry"; binding.pry
  #   count
  # end
end
