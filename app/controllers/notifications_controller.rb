class NotificationsController < ApplicationController
    before_action :authenticate_user!
    def index
        @notifications = Notification.where(reciver_id: current_user.id)
        @unread_notice = Notification.where(read: false, reciver_id: current_user.id)
        @unread_notice.present? if update_count(@unread_notice)
    end

    def show
        @notification = Notification.find(params[:id])
        @notification.update(read: true)
    end

    private
    def update_count(unread_data)   
        unread_data.update(read: true)
    end
    def notification_params
        params.require(:notification).permit(:sender_id, :sender_type, :reciver_id, :reciver_type)
    end

end
