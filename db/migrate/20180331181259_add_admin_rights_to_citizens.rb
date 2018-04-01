class AddAdminRightsToCitizens < ActiveRecord::Migration[5.1]
  def change
    add_column :citizens, :admin, :boolean
  end
end
