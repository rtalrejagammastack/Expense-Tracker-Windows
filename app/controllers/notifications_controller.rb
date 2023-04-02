class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
  end

  def mark_all_as_read
    current_user.notifications.unread.update_all(read: true)
    head :ok
  end
end
