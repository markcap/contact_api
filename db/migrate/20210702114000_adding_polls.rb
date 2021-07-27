class AddingPolls < ActiveRecord::Migration[6.1]
  def change
    create_table :polls do |t| # rubocop:disable Rails/CreateTableWithTimestamps
      t.string :name
      t.string :display_name
      t.string :phone
      t.string :email_address
      t.string :city
      t.string :state
      t.boolean :consent
      t.timestamps
    end
    add_index :polls, :email_address
  end
end
