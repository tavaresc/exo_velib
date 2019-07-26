# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :environment, 'development'
set :output, "/Users/cta/Documents/Projets/intern/Ruby/exo_velib/cron_log.log"

every 1.minute do
  runner "SaveStations.new.execute(ListStations.new.execute)"
#   command "/usr/bin/some_great_command"
#   runner "Station.new.try_whenever"
#  command "echo '---- getting stations! ----'"

#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
end

# Learn more: http://github.com/javan/whenever
