module Analyzers
  class AnalyzerInspection
    # Called before the visit.
    # Returns the initial value for `memo`
    def initial_value(query)
      puts 'initial_value'
      puts "query: #{query.class} #{query.inspect}"
      puts
      query
    end

    # This is like the `reduce` callback.
    # The return value is passed to the next call as `memo`
    def call(memo, visit_type, irep_node)
      puts 'call'
      puts "memo: #{memo.class} #{memo.inspect}"
      puts "visit: #{visit_type.class} #{visit_type.inspect}"
      puts "irep_node: #{irep_node.class} #{irep_node.inspect}"
      puts "return: #{irep_node.return_type.class} #{irep_node.return_type.inspect}"
      puts
      memo
    end

    # Called when we're done the whole visit.
    # The return value may be a GraphQL::AnalysisError (or an array of them).
    # Or, you can use this hook to write to a log, etc
    def final_value(memo)
      puts 'final_value'
      puts "memo: #{memo.class} #{memo.inspect}"
      puts
      memo
    end
  end
end
