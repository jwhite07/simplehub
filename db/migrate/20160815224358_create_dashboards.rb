class CreateDashboards < ActiveRecord::Migration[5.0]
  def change
    create_table :dashboards do |t|
      t.string :title
      t.references :organization, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
