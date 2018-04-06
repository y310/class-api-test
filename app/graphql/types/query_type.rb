class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :test_field, String, description: "An example field added by the generator", null: true

  def test_field
    "Hello World!"
  end
end
