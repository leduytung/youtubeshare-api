class ReactionService
  def self.react(params)
    return unless Reaction.react_types.values.include? params["react_type"].to_i
    et = Reaction.where(user_id: params["user_id"], movie_id: params["movie_id"]).first_or_create
    et.update(react_type: params["react_type"].to_i)
    movie = et.movie
    et.liked? ? movie.like! : movie.dislike!
  end

  def self.get_reactions(params)
    return if params["movie_ids"].blank?
    result = Reaction.where(user_id: params["user_id"], movie_id: params["movie_ids"]).pluck(:movie_id, :react_type)
    result.map {|a| [a[0].to_i, Reaction.react_types[a[1]]]}.to_h
  end
end
