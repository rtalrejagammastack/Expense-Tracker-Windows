class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
    respond_to do |format|
      format.json do
        render json: { unread_count: current_user.notifications.unread.count }
      end
      format.html do
        @notifications.update_all(read: true)
        # render partial: 'notifications'
      end
    end
  end
end
