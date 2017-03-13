class AddProjectToOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :project_id, :integer
    add_index :offers, :project_id
  end
end
