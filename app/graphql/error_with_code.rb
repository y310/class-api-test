class ErrorWithCode < GraphQL::ExecutionError
  def initialize(message, code)
    super(message, options: { extensions: { code: code } })
  end
end
