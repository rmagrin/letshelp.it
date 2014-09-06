RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # This option will default to `true` in RSpec 4
    mocks.verify_partial_doubles = true
  end

  config.order = :random
end
