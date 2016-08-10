class CreateIntegrationDefinitions < ActiveRecord::Migration[5.0]
  def change
    create_table :integration_definitions do |t|
      t.string :identifier
      t.string :display_name
      t.string :oauth_url
      t.json :metrics, default: {}
      t.json :actions, default: {}

      t.timestamps
    end
  end
end
