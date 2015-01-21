class CreateRedirections < ActiveRecord::Migration
  def change
    create_table :redirections do |t|
      t.string :country
      t.string :hyperlink
      t.boolean :active

      t.timestamps null: false
    end
  end
end
