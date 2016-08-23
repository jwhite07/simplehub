class Dashboard
  class BuildDefault
    def self.create_from_title(title, org)
      d = Dashboard.new(JSON.load(File.open("app/models/dashboard/data/#{title.downcase}.json")))
      d.organization = org
      puts d.attributes
      d.widgets.each do |w|
        puts w.attributes
        intdef = IntegrationDefinition.where(identifier: w.integration_settings["integration_definition"]).first
      
      
        w.integration = Integration.where(integration_definition: intdef).first_or_create
      end
      d.save!
      return d
    end
  end
end
