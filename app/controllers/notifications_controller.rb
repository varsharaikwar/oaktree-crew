class NotificationsController < ApplicationController
    before_action :authenticate_user!
    def index
        @notifications = Notification.where(reciver_id: current_user.id)
    end

    def show
        @notification = Notification.find(params[:id])
        @notification.update(read: true)
    end

    private
    def update_count(unread_data)   
        unread_data.update(read: true)
    end
end
