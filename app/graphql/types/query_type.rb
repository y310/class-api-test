class Types::QueryType < Types::BaseObject
  field :node, field: GraphQL::Relay::Node.field
  field :nodes, field: GraphQL::Relay::Node.plural_field
  field :posts, Types::PostType.connection_type, null: false
  field :post, Types::PostType, null: true do
    argument :id, Int, required: true
  end
  field :user, Types::UserType, null: true do
    argument :id, Int, required: true
  end
  field :viewer, Types::UserType, null: true, guard: ->(obj, args, ctx) { ctx[:current_user] }

  def test_field
    "Hello World!"
  end

  def viewer
    context[:current_user]
  end

  def user(id:)
    User.find(id)
  end

  def posts
    Post.published.all
  end

  def post(id:)
    Post.published.find(id)
  end
end
