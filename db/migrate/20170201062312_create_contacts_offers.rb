class CreateContactsOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts_offers do |t|
      t.references :contacts, foreign_key: true
      t.references :offers, foreign_key: true
    end
  end
end
