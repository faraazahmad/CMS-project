class AddLpgSubsidiyToCitizens < ActiveRecord::Migration[5.1]
  def change
    add_reference :citizens, :lpg_subsidy, foreign_key: true
  end
end
