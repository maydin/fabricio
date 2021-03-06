require 'fabricio/authorization/abstract_param_storage'
require 'fileutils'
require 'yaml'

# Constants
PARAM_FILE_PATH = "#{FABRICIO_DIRECTORY_PATH}/.params"

module Fabricio
  module Authorization
    # Stores default params as organization, app, etc.
    class FileParamStorage < AbstractParamStorage

      # Returns all stored variable
      #
      # @return [Hash]
      def obtain
        return nil unless File.exist?(PARAM_FILE_PATH)
        params = YAML.load_file(PARAM_FILE_PATH)
        return {} unless params
        return params
      end

      # Save variable
      #
      # @param hash [Hash]
      def store(hash)
        save_to_file(hash)
      end

      # Resets current state and deletes all saved params
      def reset
        FileUtils.remove_file(PARAM_FILE_PATH)
      end

      def organization_id
        hash = obtain || {}
        hash['organization_id']
      end

      def app_id
        hash = obtain || {}
        hash['app_id']
      end

      def store_organization_id(organization_id)
        hash = obtain || {}
        hash['organization_id'] = organization_id
        save_to_file(hash)
      end

      def store_app_id(app_id)
        hash = obtain || {}
        hash['app_id'] = app_id
        save_to_file(hash)
      end

      private

      def save_to_file(hash)
        FileUtils.mkdir_p(FABRICIO_DIRECTORY_PATH)
        File.open(PARAM_FILE_PATH,'w') do |f|
          f.write hash.to_yaml
        end
      end
    end
  end
end
