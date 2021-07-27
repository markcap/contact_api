class AddingLettersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :letters do |t| # rubocop:disable Rails/CreateTableWithTimestamps
      t.string :name
      t.string :daytime_phone
      t.string :nighttime_phone
      t.string :email_address
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.text :message
      t.timestamps
    end
    add_index :letters, :email_address
  end
end
