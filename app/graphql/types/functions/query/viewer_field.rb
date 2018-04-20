class Types::Functions::Query::ViewerField < GraphQL::Function
  def call(obj, args, ctx)
    ctx[:current_user]
  end
end
