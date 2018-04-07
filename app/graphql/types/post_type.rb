class Types::PostType < Types::BaseObject
  description 'Post object'

  field :title, String, null: false
  field :body, String, null: true

  field :comments, Types::CommentType.connection_type, null: false
end
