class Types::Objects::UserType < Types::Objects::BaseObject
  implements GraphQL::Relay::Node.interface

  description 'User object'

  global_id_field :id
  field :name, String, null: false

  field :posts, Types::Objects::PostType.connection_type, null: false, complexity: 5
  field :comments, Types::Objects::CommentType.connection_type, null: false, complexity: 5
  field :draftPosts, Types::Objects::PostType.connection_type, null: false, guard: ->(type_obj, args, ctx) { ctx[:current_user]&.id == type_obj.object.id }, complexity: 5

  def posts
    object.posts.published
  end

  def draft_posts
    object.posts.draft
  end
end
