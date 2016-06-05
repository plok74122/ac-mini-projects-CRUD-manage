class AddBuyTimeAndPublishDateToBook < ActiveRecord::Migration
  def change
    add_column :books , :buy_time , :datetime
    add_column :books , :publish_date , :date
  end
end
