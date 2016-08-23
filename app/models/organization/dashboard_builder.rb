class Organization
  class DashboardBuilder
    attr_accessor :organization
    def initialize(organization)
      @organization = organization
    end
    def create_default_dashboards
      defaults = Rails.configuration.new_org_defaults
      defaults.each do |db|
         Dashboard::BuildDefault.create_from_title(db,self.organization)
        
      end
    end
  end
end