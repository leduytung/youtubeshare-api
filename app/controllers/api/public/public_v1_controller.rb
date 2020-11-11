module Api::Public
  class PublicV1Controller < PublicApplicationController
    include Api::ExceptionsHandler
  end
end