class ReactionService
  def self.react(params)
    return unless Reaction.react_types.values.include? params["react_type"].to_i
    et = Reaction.find_by(user_id: params["user_id"], movie_id: params["movie_id"])
    if et
      et.change_reaction(params["react_type"].to_i)
    else
      Reaction.create(user_id: params["user_id"], movie_id: params["movie_id"], react_type: params["react_type"].to_i)
    end
  end

  def self.get_reactions(params)
    return if params["movie_ids"].blank?
    result = Reaction.where(user_id: params["user_id"], movie_id: params["movie_ids"]).pluck(:movie_id, :react_type)
    result.map {|a| [a[0].to_i, Reaction.react_types[a[1]]]}.to_h
  end
end
