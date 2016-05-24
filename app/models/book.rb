class Book < ActiveRecord::Base
  belongs_to :book_condition
  validates_presence_of :name ,:description
  validates_numericality_of :cost
  validates_numericality_of :book_condition_id , :only_integer => true
end
