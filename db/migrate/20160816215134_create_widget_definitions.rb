class CreateWidgetDefinitions < ActiveRecord::Migration[5.0]
  def change
    enable_extension :hstore
    create_table :widget_definitions do |t|
      t.string :name
      t.hstore :settings, default: {}

      t.timestamps
    end
  end
end
