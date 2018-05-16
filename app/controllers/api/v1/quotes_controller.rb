module Api
  module V1
    class QuotesController < ApplicationController
      def index
        @quotes = Quote.all
      end

      def show
        @quote = Quote.find(params[:id])
      end
    end
  end
end
