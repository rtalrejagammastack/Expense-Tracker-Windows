Implement notification delivery mechanism using Action Mailer:
ruby
Copy code
class NotificationMailer < ApplicationMailer
  def new_expense_notification(user, expense)
    @user = user
    @expense = expense
    mail(to: @user.email, subject: "New expense added")
  end
end
Set up a notification delivery system using delayed_job:
ruby
Copy code
class NotificationJob < ApplicationJob
  queue_as :default

  def perform(notification)
    # Send email notification using Action Mailer
    NotificationMailer.new_expense_notification(notification.user, notification.expense).deliver_now
  end
end
Call the notification delivery system:
ruby
Copy code
class ExpensesController < ApplicationController
  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      # Create a new notification for the user
      create_notification(@expense.user_id, "New expense added: #{expense_params[:name]}")

      # Queue notification job for background processing
      NotificationJob.perform_later(Notification.last)

      redirect_to @expense
    else
      render 'new'
    end
  end

  private

  def create_notification(user_id, content)
    notification = Notification.new
    notification.user_id = user_id
    notification.content = content
    notification.expense = @expense
    notification.save
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :user_id)
  end
end
These examples d