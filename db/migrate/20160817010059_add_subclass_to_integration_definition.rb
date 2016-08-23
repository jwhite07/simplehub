class AddSubclassToIntegrationDefinition < ActiveRecord::Migration[5.0]
  def change
    add_column :integration_definitions, :subclass, :string
  end
end
