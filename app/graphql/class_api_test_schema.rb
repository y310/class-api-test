class ClassApiTestSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  use GraphQL::Guard.new

  rescue_from GraphQL::Guard::NotAuthorizedError do |exception|
    "Not authorized: #{exception.message}"
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    exception.message
  end

  def self.object_from_id(unique_id, context)
    class_name, id = unique_id.unpack('m').first.split('_')
    class_name.constantize.find_by(id: id)
  end

  def self.id_from_object(object, type, context)
    ["#{object.class}_#{object.id}"].pack('m').strip
  end

  def self.resolve_type(type, obj, ctx)
    case obj
    when User
      Types::UserType
    when Post
      Types::PostType
    when Comment
      Types::CommentType
    else
      raise NotImplementedError, obj
    end
  end
end
