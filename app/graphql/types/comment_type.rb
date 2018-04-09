class Types::CommentType < Types::BaseObject
  implements GraphQL::Relay::Node.interface
  description 'Comment object'

  global_id_field :id
  field :message, String, null: false
  field :user, Types::UserType, null: false
  field :post, Types::PostType, null: false
end
