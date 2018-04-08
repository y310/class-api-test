class ClassApiTestSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  use GraphQL::Guard.new
end

GraphQL::Errors.configure(ClassApiTestSchema) do
  rescue_from ActiveRecord::RecordNotFound do |exception, obj, args, ctx|
    ctx.add_error(GraphQL::ExecutionError.new(exception.message))
  end
end
