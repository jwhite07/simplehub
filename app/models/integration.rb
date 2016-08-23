class Integration < ApplicationRecord
  belongs_to :organization
  belongs_to :integration_definition
end
