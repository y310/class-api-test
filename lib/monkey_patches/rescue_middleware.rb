module GraphQL
  class Schema
    class RescueMiddleware
      private

      def attempt_rescue(err)
        handler = rescue_table[err.class]
        if handler
          error = handler.call(err)
          if error.is_a?(GraphQL::ExecutionError)
            error
          else
            GraphQL::ExecutionError.new(error)
          end
        else
          raise(err)
        end
      end
    end
  end
end
