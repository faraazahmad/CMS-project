class AddDobToCitizens < ActiveRecord::Migration[5.1]
  def change
    add_column :citizens, :dob, :date
  end
end
