namespace :botmetrics do
  desc "RolledupEventQueue.flush"
  # every(5.minutes, 'RolledupEventQueue.flush') do
  task :rolled_up_event_queue_flush => :environment do
    sleep(rand(0.1))
    RolledupEventQueue.flush!
  end

  desc "Messages.Send"
  #every(2.minutes, 'Messages.Send') do
  task :messages_send => :environment do
    SendScheduledMessageJob.perform_async
  end
  
  desc "DailyReport.Send"
  #every(5.minutes, 'DailyReport.Send') do
  task :daily_report_send => :environment do
    SendDailyReportsJob.perform_async
  end

  desc "Notification.recurring_send"
  #every(5.minutes, 'Notification.recurring_send') do
  task :notification_recurring_send => :environment do
    SendRecurringNotificationsJob.perform_async
  end

  desc "SendHeartbeatJob"
  #every(12.hours, 'SendHeartbeatJob') do
  task :send_heart_beat_job => :environment do
    SendHeartbeatJob.perform_async
  end
end
