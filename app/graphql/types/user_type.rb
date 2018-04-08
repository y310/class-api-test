class Types::UserType < Types::BaseObject
  description 'User object'

  field :name, String, null: false

  field :posts, Types::PostType.connection_type, null: false
  field :comments, Types::CommentType.connection_type, null: false

  def posts
    object.posts.published
  end
end
