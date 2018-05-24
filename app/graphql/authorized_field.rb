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

    if @connection
      arg = argument :first, Integer, "first is always required to make sure limited number of items is fetched", required: true
      field_defn.arguments['first'] = arg.to_graphql
    end

    field_defn
  end
end
