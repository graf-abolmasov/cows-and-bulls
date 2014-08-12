RSpec.configure do |config|
  config.include APIMatchers::RSpecMatchers
end

APIMatchers.setup do |config|
  config.response_body_method = :body
  config.http_status_method = :status
end