class Notification < ApplicationRecord
  belongs_to :user

  default_scope { order(created_at: :desc) }

  scope :unread, -> { where(read: false) }
end
