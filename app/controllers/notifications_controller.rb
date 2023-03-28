class NotificationsController < ApplicationController
    before_action :authenticate_user!
    def index
        @notifications = Notification.where(user_id: current_user.id)    
    end

    def show
        @notification = Notification.find(params[:id])
    end

    private

    def notification_params
        params.require(:notification).permit(:sender_id, :sender_type, :reciver_id, :reciver_type)
    end

end
