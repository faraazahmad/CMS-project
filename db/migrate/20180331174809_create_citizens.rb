class CreateCitizens < ActiveRecord::Migration[5.1]
  def change
    create_table :citizens do |t|
      t.string :name
      t.string :phone_number
      t.string :gender
      t.string :occupation
      t.boolean :marital_status

      t.timestamps
    end
    add_index :citizens, :phone_number, unique: true
  end
end
