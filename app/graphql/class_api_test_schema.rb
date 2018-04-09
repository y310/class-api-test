class ClassApiTestSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  use GraphQL::Guard.new

  rescue_from GraphQL::Guard::NotAuthorizedError do |exception|
    "Not authorized: #{exception.message}"
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    exception.message
  end
end
