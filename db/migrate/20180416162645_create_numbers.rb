class CreateNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :numbers do |t|
      t.integer :number

      t.timestamps
    end
  end
end
