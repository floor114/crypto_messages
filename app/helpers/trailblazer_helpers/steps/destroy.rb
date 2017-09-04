module TrailblazerHelpers
  module Steps
    class Destroy
      extend Uber::Callable

      def self.call(_options, model:, **)
        model.destroy
      end
    end
  end
end
