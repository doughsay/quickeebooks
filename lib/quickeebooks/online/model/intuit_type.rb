module Quickeebooks
  module Online
    module Model
      class IntuitType
        include ROXML
        
        # These can be over-ridden in each model object as needed
        # For the most part a model object has a single resource for all operations
        # E.g. <baseURL>/resource/invoice/v2/<realmID>
        # But for the Account object its collection is plural while all other operations are singular
        # E.g. 
        # Fetch all accounts: <baseURL>/resource/accounts/v2/<realmID> 
        #     vs
        # Create an account, fetch an account, etc: <baseURL>/resource/account/v2/<realmID>
        def self.resource_for_collection
          self::REST_RESOURCE
        end

        def self.resource_for_singular
          self::REST_RESOURCE
        end

        
        private

        # ROXML doesnt insert the namespaces into generated XML so we need to do it ourselves
        # insert the static namespaces in the first opening tag that matches the +model_name+
        def to_xml_inject_ns(model_name, options = {})
          s = StringIO.new
          xml = to_xml(options).write_to(s, :indent => 0, :indent_text => '')
          s.string.sub("<#{model_name}>", "<#{model_name} #{Quickeebooks::Online::Service::ServiceBase::XML_NS}>")
        end

        def log(msg)
          Quickeebooks.logger.info(msg)
          Quickeebooks.logger.flush if Quickeebooks.logger.respond_to?(:flush)
        end

      end 
    end    
  end
end
