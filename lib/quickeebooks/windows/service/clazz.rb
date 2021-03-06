require 'quickeebooks/windows/model/clazz'
require 'quickeebooks/windows/service/service_base'

module Quickeebooks
  module Windows
    module Service
      class Clazz < Quickeebooks::Windows::Service::ServiceBase

        def list(filters = [], page = 1, per_page = 20, sort = nil, options = {})
          custom_field_query = '<?xml version="1.0" encoding="utf-8"?>'
          custom_field_query += '<ClassQuery xmlns="http://www.intuit.com/sb/cdm/v2">'
          custom_field_query += "<StartPage>#{page}</StartPage><ChunkSize>#{per_page}</ChunkSize>"
          custom_field_query += '</ClassQuery>'
          fetch_collection(Quickeebooks::Windows::Model::Clazz, custom_field_query.strip, filters, page, per_page, sort, options)
        end

      end
    end
  end
end