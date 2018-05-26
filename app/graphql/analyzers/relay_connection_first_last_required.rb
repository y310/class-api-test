module Analyzers
  class RelayConnectionFirstLastRequired
    def initial_value(query)
      []
    end

    def call(errors, visit_type, irep_node)
      if first_and_last_missing?(visit_type, irep_node)
        errors << GraphQL::AnalysisError.new("You must provide a `first` or `last` value to properly paginate the `#{irep_node.name}` connection.")
      end
      errors
    end

    def final_value(errors)
      errors
    end

    def first_and_last_missing?(visit_type, irep_node)
      visit_type == :enter &&
        connection_node?(irep_node) &&
        !has_first_or_last?(irep_node)
    end

    def connection_node?(irep_node)
      irep_node&.definition&.connection?
    end

    def has_first_or_last?(irep_node)
      !(%w(first last) & irep_node.arguments.keys).empty?
    end
  end
end
