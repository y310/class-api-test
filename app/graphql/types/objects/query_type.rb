class Types::Objects::QueryType < Types::Objects::BaseObject
  field :node, field: GraphQL::Relay::Node.field
  field :nodes, field: GraphQL::Relay::Node.plural_field
  field :posts, Types::Objects::PostType.connection_type, null: false
  field :post, Types::Objects::PostType, null: true do
    argument :id, Int, required: true
  end
  field :user, Types::Objects::UserType, null: true do
    argument :id, Int, required: true
  end
  field :viewer, Types::Objects::UserType, null: true, guard: ->(obj, args, ctx) { ctx[:current_user] }

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
