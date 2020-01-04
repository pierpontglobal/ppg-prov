bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
rm /home/app/tmp/pids/server.pid
bundle exec rails server -b 0.0.0.0