module Honeybadger
  module Api
    class Deploy

      attr_reader :id, :project_id, :repository, :revision, :environment, :local_username, :created_at

      # Public: Build a new instance of Deploy
      #
      # opts - A Hash of attributes to initialize a Deploy
      #
      # Returns a new Deploy
      def initialize(opts)
        @id = opts[:id]
        @project_id = opts[:project_id]
        @repository = opts[:repository]
        @revision = opts[:revision]
        @environment = opts[:environment]
        @local_username = opts[:local_username]
        @created_at = opts[:created_at].nil? ? nil : DateTime.parse(opts[:created_at])
      end

      # Public: Find all deploys for a given project.
      def self.all(project_id)
        path = "projects/#{project_id}/deploys"
        Honeybadger::Api::Request.all(path, handler)
      end

      # Public: Paginate all deploys for a given project
      def self.paginate(project_id, filters = {})
        path = "projects/#{project_id}/deploys"
        Honeybadger::Api::Request.paginate(path, handler, filters)
      end

      # Public: Find a deploy for a given project.
      def self.find(project_id, deploy_id)
        path = "projects/#{project_id}/deploys/#{deploy_id}"
        Honeybadger::Api::Request.find(path, handler)
      end

      # Internal: The handler used to build objects from API responses.
      def self.handler
        Proc.new { |response| Deploy.new(response) }
      end
    end
  end
end