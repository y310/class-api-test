class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :test_field, String, description: "An example field added by the generator", null: true
  field :posts, Types::PostType.connection_type, null: false
  field :post, Types::PostType, null: true do
    argument :id, Int, required: true
  end

  def test_field
    "Hello World!"
  end

  def posts
    Post.all
  end

  def post(id:)
    Post.find(id)
  end
end
