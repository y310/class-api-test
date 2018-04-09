class Types::PostType < Types::BaseObject
  implements GraphQL::Relay::Node.interface
  description 'Post object'

  global_id_field :id
  field :title, String, null: false
  field :body, String, null: true

  field :user, Types::UserType, null: false
  field :comments, Types::CommentType.connection_type, null: false
end
