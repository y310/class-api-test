class ClassApiTestSchema < GraphQL::Schema
  mutation(Types::Objects::MutationType)
  query(Types::Objects::QueryType)
  use GraphQL::Guard.new
  use GraphQL::Batch

  query_analyzer Analyzers::RelayConnectionFirstLastRequired.new

  max_depth 10
  max_complexity 500

  rescue_from GraphQL::Guard::NotAuthorizedError do |exception|
    ErrorWithCode.new("Not authorized: #{exception.message}", 'E001')
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    ErrorWithCode.new(exception.message, 'E002')
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
      Types::Objects::UserType
    when Post
      Types::Objects::PostType
    when Comment
      Types::Objects::CommentType
    else
      raise NotImplementedError, obj
    end
  end
end
