class AddTemplateToWidgetDefinition < ActiveRecord::Migration[5.0]
  def change
    add_column :widget_definitions, :template, :json, default: {}
  end
end
