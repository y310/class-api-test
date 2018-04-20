class Types::Functions::Query::UserField < GraphQL::Function
  def call(obj, args, ctx)
    User.find(args[:id])
  end
end
