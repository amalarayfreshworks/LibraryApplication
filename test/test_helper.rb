ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
# RSpec.configure do |config|
#   # Start an in-memory cluster for Elasticsearch as needed
#   config.before :all, elasticsearch: true do
#     Elasticsearch::Extensions::Test::Cluster.start(port: 9250, nodes: 1, timeout: 120) unless Elasticsearch::Extensions::Test::Cluster.running?(on: 9250)
#   end

#   # Stop elasticsearch cluster after test run
#   config.after :suite do
#     Elasticsearch::Extensions::Test::Cluster.stop(port: 9250, nodes: 1) if Elasticsearch::Extensions::Test::Cluster.running?(on: 9250)
#   end
# end
# RSpec.configure do |config|
#   # Create indexes for all elastic searchable models
#   config.before :each, elasticsearch: true do
#     ActiveRecord::Base.descendants.each do |model|
#       if model.respond_to?(:__elasticsearch__)
#         begin
#           model.__elasticsearch__.create_index!
#           model.__elasticsearch__.refresh_index!
#         rescue => Elasticsearch::Transport::Transport::Errors::NotFound
#           # This kills "Index does not exist" errors being written to console
#           # by this: https://github.com/elastic/elasticsearch-rails/blob/738c63efacc167b6e8faae3b01a1a0135cfc8bbb/elasticsearch-model/lib/elasticsearch/model/indexing.rb#L268
#         rescue => e
#           STDERR.puts "There was an error creating the elasticsearch index for #{model.name}: #{e.inspect}"
#         end
#       end
#     end
#   end

#   # Delete indexes for all elastic searchable models to ensure clean state between tests
#   config.after :each, elasticsearch: true do
#     ActiveRecord::Base.descendants.each do |model|
#       if model.respond_to?(:__elasticsearch__)
#         begin
#           model.__elasticsearch__.delete_index!
#         rescue => Elasticsearch::Transport::Transport::Errors::NotFound
#           # This kills "Index does not exist" errors being written to console
#           # by this: https://github.com/elastic/elasticsearch-rails/blob/738c63efacc167b6e8faae3b01a1a0135cfc8bbb/elasticsearch-model/lib/elasticsearch/model/indexing.rb#L268
#         rescue => e
#           STDERR.puts "There was an error removing the elasticsearch index for #{model.name}: #{e.inspect}"
#         end
#       end
#     end
#   end
# end
end
