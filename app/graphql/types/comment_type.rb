class Types::CommentType < Types::BaseObject
  description 'Comment object'

  field :message, String, null: false
  field :post, Types::PostType, null: false
end
