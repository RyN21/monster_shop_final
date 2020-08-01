class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name,
                        :description,
                        :percent_off,
                        :minimum_quantity
  
end
