module Constants
    class PublicMoviesController
      ResponseFieldsAllow = ["id", "title", "description", "user_id", "url"]
    end

    class SecureMoviesController
      ResponseFieldsAllow = ["id", "title", "description", "user_id", "url", "like", "dislike"]
    end
end