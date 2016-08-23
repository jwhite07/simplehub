class ChangesToWidgetDefinitions < ActiveRecord::Migration[5.0]
  def change
    rename_column :widget_definitions, :settings, :chart_settings
    add_column :widget_definitions, :data_settings, :hstore, default: {}
  end
end
