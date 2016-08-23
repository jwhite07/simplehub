class Widget < ApplicationRecord
  belongs_to :dashboard, inverse_of: :widgets
  belongs_to :widget_definition
  belongs_to :integration
end
