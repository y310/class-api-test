class Types::Objects::BaseObject < GraphQL::Schema::Object
  field_class AuthorizedField
  accepts_definition :guard

  def self.decorated(enabled)
    @decorated = enabled
  end

  def self.decorated?
    !!@decorated
  end

  def object
    self.class.decorated? ? super.decorate : super
  end
end
