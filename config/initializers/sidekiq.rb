Sidekiq.configure_server do |config|
  config.redis = { url: ENV['JOB_WORKER_URL'] }
  schedule_file = "config/schedule.yml"
  if File.exist?(schedule_file) && Sidekiq.server?
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['JOB_WORKER_URL'] }
end


