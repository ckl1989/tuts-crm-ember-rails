class AddOfferToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :offer_id, :integer
    add_index :tasks, :offer_id
  end
end
