class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end

  def send_notification(data)
    notification = current_user.notifications.create(content: data['message'])
    NotificationsChannel.broadcast_to(current_user, notification: render_notification(notification))
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def render_notification(notification)
    ApplicationController.renderer.render(partial: 'notifications/notification', locals: { notification: notification })
  end
end
