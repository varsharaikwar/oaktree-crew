class HomesController < ApplicationController
    before_action :authenticate_user!
    def index
        redirect_to candidates_path
    end
end
