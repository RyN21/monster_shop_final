class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name,
                        :description,
                        :percent_off,
                        :minimum_quantity

  def date_created
    created_at.strftime("%d %B %Y")
  end
end
