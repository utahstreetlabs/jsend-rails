module JSend
  module Rails
    module Controller
      def render_jsend(options_or_status)
        render(:json => Envelope.compute(options_or_status))
      end
    end
  end
end
