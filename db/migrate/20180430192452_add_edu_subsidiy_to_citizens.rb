class AddEduSubsidiyToCitizens < ActiveRecord::Migration[5.1]
  def change
    add_reference :citizens, :edu_subsidy, foreign_key: true
  end
end
