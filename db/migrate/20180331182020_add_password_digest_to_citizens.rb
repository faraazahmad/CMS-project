class AddPasswordDigestToCitizens < ActiveRecord::Migration[5.1]
  def change
    add_column :citizens, :password_digest, :string
  end
end
