class IntegrationDefinition < ApplicationRecord
  def subclass
    self[:subclass].constantize()
  end
end
