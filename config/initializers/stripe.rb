if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_nnUh7geEQTXl94WjbxMA42ef',
    secret_key: 'sk_test_kkRKXFiD0FLV0QBfAqcfmDtO'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

#  reference your Stripe credentials as Rails.configuration.stripe[:publishable_key] anywhere in your app.
