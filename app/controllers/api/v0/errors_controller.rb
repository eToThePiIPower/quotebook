module Api
  module V0
    class ErrorsController < ApplicationController
      def invalid_path
        render json: { status: 'error', code: 4000, message: 'path not found' }
      end
    end
  end
end
