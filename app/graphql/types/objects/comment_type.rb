class Types::Objects::CommentType < Types::Objects::BaseObject
  implements GraphQL::Relay::Node.interface
  description 'Comment object'

  global_id_field :id
  field :message, String, null: false
  field :user, Types::Objects::UserType, null: false
  field :post, Types::Objects::PostType, null: false
end
