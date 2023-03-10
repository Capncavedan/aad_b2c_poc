require Rails.root.join('lib', 'aad_b2c_strategy.rb')

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?

  provider :aad_b2c_strategy
end
