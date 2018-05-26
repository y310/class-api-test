class AuthorizedField < GraphQL::Schema::Field
  # Override #initialize to take a new argument:
  def initialize(*args, guard: nil, **kwargs, &block)
    @guard = guard
    # Pass on the default args:
    super(*args, **kwargs, &block)
  end

  def to_graphql
    field_defn = super # Returns a GraphQL::Field
    field_defn.metadata[:guard] = @guard
    field_defn
  end
end
