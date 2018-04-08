class Types::BaseObject < GraphQL::Schema::Object
  field_class AuthorizedField
  accepts_definition :guard
end
