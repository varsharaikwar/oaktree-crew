class CommentsController < ApplicationController
  before_action :find_candidate ,only: [:create]
    def new
      @comment = Comment.new
    end
  
    def create
      @comment = @candidate.comments.new(content: params[:content], user_id: current_user.id)
      if @comment.save
          redirect_to @candidate
      else
          render :candidates_path
      end
    end

    def show
        
    end
    def destroy
      @comment = Comment.find(params[:id])
      @comment.delete
      respond_to do |format|
        format.js
      end
    end

    private
    def find_candidate
        @candidate = Candidate.find(params[:id])
    end
end
