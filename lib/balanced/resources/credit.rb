module Balanced
  # A Credit represents a transfer of funds from your Marketplace to a
  # Merchant's Account within your Marketplace.
  #
  # By default, a Credit is sent to the most recently added funding
  # destination associated with an Account. You may specify a specific
  # funding source.
  #
  class Credit
    include Balanced::Resource
    def initialize attributes = {}
      Balanced::Utils.stringify_keys! attributes
      unless attributes.has_key? 'uri'
        attributes['uri'] = Balanced::Marketplace.my_marketplace.send(self.class.collection_name + '_uri')
      end
      super attributes
    end
  end
end

