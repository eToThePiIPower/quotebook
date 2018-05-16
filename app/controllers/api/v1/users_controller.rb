module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
      end

      def show
        @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: {
          status: 'error',
          code: 3000,
          message: 'Record not found',
        }
      end
    end
  end
end
