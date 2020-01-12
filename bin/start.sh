bundle exec bin/rails db:create
bundle exec bin/rails db:migrate
bundle exec bin/rails db:seed
rm /home/app/tmp/pids/server.pid
bundle exec bin/rails server -p ${PORT} -e ${RAILS_ENV}