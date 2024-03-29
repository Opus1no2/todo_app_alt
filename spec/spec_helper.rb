# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
require './spec/helpers/session_helper'

RSpec.configure do |config|
  config.include SessionHelper, type: :request

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
