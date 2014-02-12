require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

User.blueprint do
  name                  { 'Test User' }
  email                 { "example-#{sn}@example.com" }
  password              { 'changeme' }
  password_confirmation { 'changeme' }
  # required if the Devise Confirmable module is used
  confirmed_at          { Time.now }
end

Role.blueprint do
  # Attributes here
end

InternetDataUsage.blueprint do
  date_n_time           { Time.now }
  data                  { 20.1 }
end
