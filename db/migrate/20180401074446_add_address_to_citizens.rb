class AddAddressToCitizens < ActiveRecord::Migration[5.1]
  def change
    add_column :citizens, :address, :text
  end
end
