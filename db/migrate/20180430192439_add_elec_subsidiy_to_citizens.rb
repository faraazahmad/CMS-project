class AddElecSubsidiyToCitizens < ActiveRecord::Migration[5.1]
  def change
    add_reference :citizens, :elec_subsidy, foreign_key: true
  end
end
