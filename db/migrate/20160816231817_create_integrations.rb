class CreateIntegrations < ActiveRecord::Migration[5.0]
  def change
    create_table :integrations do |t|
      t.references :organization, foreign_key: true
      t.references :integration_definition, foreign_key: true
      t.string :name, default: ""
      t.string :token, default: ""
      t.string :dc, default: ""
      t.string :api_key, default: ""

      t.timestamps
    end
  end
end
