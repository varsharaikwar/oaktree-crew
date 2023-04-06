class NotificationsController < ApplicationController
    before_action :authenticate_user!
    def index
        @notifications = Notification.where(reciver_id: current_user.id)  
    end
    
    def show
        @notification = Notification.find(params[:id])
        update_count(@notification)
    end

    private
    def update_count(notification)   
        notification.update(read: true)
    end
end


