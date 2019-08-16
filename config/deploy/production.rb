set :stage, :production
server '80.211.200.102', user: 'deploy', roles: %w{web app db}
