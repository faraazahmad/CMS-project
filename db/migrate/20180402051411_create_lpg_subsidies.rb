class CreateLpgSubsidies < ActiveRecord::Migration[5.1]
  def change
    create_table :lpg_subsidies do |t|
      t.references :citizen, foreign_key: true

      t.timestamps
    end
  end
end
