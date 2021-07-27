ENV.each_key do |key|
  env key.to_sym, ENV[key]
end

set :environment, ENV["RAILS_ENV"]

every :day, at: '7:00am', roles: [:app] do
  if ENV["RAILS_ENV"] == "production"
    rake "sitemap:refresh"
  else
    rake "sitemap:refresh:no_ping"
  end
end