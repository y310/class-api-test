class Types::Objects::PostType < Types::Objects::BaseObject
  decorated true
  implements GraphQL::Relay::Node.interface
  description 'Post object'

  global_id_field :id
  field :title, String, null: false
  field :body, String, null: true
  field :createdAt, Types::Scalars::DateTime, null: false
  field :test, String, null: true, deprecation_reason: 'This field is deprecated'
  field :argumentTest, Boolean, null: false do
    argument :flag, Boolean, required: true
  end

  field :user, Types::Objects::UserType, null: false, complexity: 5
  field :comments, Types::Objects::CommentType.connection_type, null: false, complexity: 5

  def argument_test(flag:)
    flag
  end
end
