class ChangesToWidgetDefinitions2 < ActiveRecord::Migration[5.0]
  def change
    change_column :widget_definitions, :template, :string, default: ""
  end
end
