module Constants
    class PublicMoviesController
      ResponseFieldsAllow = ["id", "title", "description", "user_id"]
    end

    class SecureMoviesController
      ResponseFieldsAllow = ["id", "title", "description", "user_id", "upvote", "downvote"]
    end
end