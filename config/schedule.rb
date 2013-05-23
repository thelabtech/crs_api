job_type :rake,    "cd :path && RAILS_ENV=:environment /usr/local/bin/bundle exec /usr/local/bin/rake :task --silent :output"
job_type :rails,    "cd :path && RAILS_ENV=:environment /usr/local/bin/bundle exec /usr/local/bin/rails :task --silent :output"
job_type :runner,    "cd :path && RAILS_ENV=:environment /usr/local/bin/bundle exec /usr/local/bin/rails runner :task --silent :output"

every 1.day do
  rake 'siebel:link'
  rake 'relay:emails'
end

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

