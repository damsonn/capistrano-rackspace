require 'fog'

class Rackspace

  class Configuration

    class << self
      attr_accessor :username
      attr_accessor :api_key
      attr_accessor :region
      attr_accessor :autoscale_group
    end

    attr_reader :autoscale_group

    def self.instantiate
      new(
        :username => username,
        :api_key => api_key,
        :region => region,
        :autoscale_group => autoscale_group
      )
    end

    def initialize(options = {})
      [ :username, :api_key, :region, :autoscale_group ].each do |attr|
        instance_variable_set "@#{attr}", options[attr]
      end
    end

    def common
      {
        :rackspace_username => @username,
        :rackspace_api_key => @api_key,
        :rackspace_region => @region
      }
    end

    def compute
      common.merge(:provider => 'Rackspace', :version => :v2)
    end
  end

  class AutoScale

    def initialize
      @config = Configuration.instantiate
      @autoscale_service = Fog::Rackspace::AutoScale.new(@config.common)
      @compute_service = Fog::Compute.new(@config.compute)
    end

    def addresses
      @server_addresses_public ||= addresses_by_type('public')
    end

    def private_addresses
      @server_addresses_private ||= addresses_by_type('private')
    end

    private

    def addresses_by_type(type)
      server_ids.map { |id| @compute_service.servers.get id }
                .flat_map { |h| h.addresses[type] } # only the type we want (private|public)
                .select { |iface| iface['version'] == 4 }
                .map { |iface| iface["addr"] }
    end

    def server_ids
      @autoscale_service.groups
                        .find { |g| g.group_config.name == @config.autoscale_group }
                        .state['active']
                        .map { |h| h['id'] }
    end
  end

end
