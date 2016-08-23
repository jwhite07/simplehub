require 'rails_helper'

RSpec.describe WidgetDefinition, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:widget_definition)).to be_valid
  end
  it "is invalid without a name" do
    expect(FactoryGirl.build(:widget_definition, name: nil)).to be_invalid
  end
  
  
end
