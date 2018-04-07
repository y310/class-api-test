class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :test_field, String, description: "An example field added by the generator", null: true
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
    Post.all
  end

  def post(id:)
    Post.find(id)
  end
end
