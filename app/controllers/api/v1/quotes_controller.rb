module Api
  module V1
    class QuotesController < ApplicationController
      def index
        @quotes = Quote.all
      end

      def show
        @quote = Quote.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { status: 'error', code: 3000, message: 'Record not found' }
      end
    end
  end
end
