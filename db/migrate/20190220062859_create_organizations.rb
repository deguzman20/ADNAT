class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.decimal :hourly_rate, default: :nil, scale: 2, precision: 10

      t.timestamps
    end
  end
end
