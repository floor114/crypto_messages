module TrailblazerHelpers
  module Steps
    class DelayedDestroy
      extend Uber::Callable

      def self.call(_options, model:, **)
        MessageDestroyWorker.perform_in(model.destroy_date, model.id)
      end
    end
  end
end
