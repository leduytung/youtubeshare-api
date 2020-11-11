module Api::ExceptionsHandler
  extend ActiveSupport::Concern
  included do
    rescue_from Exception do |e|
      status, message =
        case e
        when ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved
          [422, e.record.errors.full_messages.join(', ')]
        when ApplicationError
          [400, e.message]
        when AuthenticationError
          [401, e.message]
        when ActiveRecord::RecordNotFound
          [404, e.message]
        else
          [500, e.message]
        end
      logger.error e
      render json: {error: message}, status: status
    end
  end
end

class ApplicationError < StandardError; end
class AuthenticationError < StandardError; end
