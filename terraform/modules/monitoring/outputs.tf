output "channel_id" {
  value       = google_monitoring_notification_channel.email.id
  description = "The ID of the monitoring notification channel"
}

output "channel_name" {
  value       = google_monitoring_notification_channel.email.name
  description = "The resource name of the notification channel"
}
