class CreateWidgets < ActiveRecord::Migration[5.0]
  def change
    create_table :widgets do |t|
      t.string :title, default: ""
      t.references :dashboard, foreign_key: true
      t.references :widget_definition, foreign_key: true
      t.hstore :chart_settings, default: {}
      t.hstore :data_settings, default: {}
      t.hstore :dashboard_settings, default: {}
      t.references :integration, foreign_key: true
      t.hstore :integration_settings, default: {}
      t.string :image, default: ""

      t.timestamps
    end
  end
end
