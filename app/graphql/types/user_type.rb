class Types::UserType < Types::BaseObject
  implements GraphQL::Relay::Node.interface

  description 'User object'

  global_id_field :id
  field :name, String, null: false

  field :posts, Types::PostType.connection_type, null: false
  field :comments, Types::CommentType.connection_type, null: false
  field :draftPosts, Types::PostType.connection_type, null: false, guard: ->(type_obj, args, ctx) { ctx[:current_user]&.id == type_obj.object.id }

  def posts
    object.posts.published
  end

  def draft_posts
    object.posts.draft
  end
end
