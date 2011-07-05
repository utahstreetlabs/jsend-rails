module JSend
  module Rails
    module Controller

      # Render a jsend response
      #
      # By default, renders using +render json:+
      #
      # If you need to tweak rendering options, for example to render json inside
      # a <textarea> to fix cranky browsers, pass a :render hash, like:
      #
      # +render_jsend {success: {}, render: {as: :text, layout: 'json'}}+
      #
      # In the :render, the :as key will be used to control the rendering format.
      # Any other options will be passed directly to the render call. The example
      # above will result in the following call to render:
      #
      # +render text: {...}, layout: 'json'+
      def render_jsend(options_or_status)
        render_options = if options_or_status.is_a?(Hash)
          render_options = options_or_status[:render] || {}
          format = render_options.delete(:as) || :json
          render_options[format] = Envelope.compute(options_or_status).to_json
          render_options
        else
          {json: Envelope.compute(options_or_status)}
        end
        render render_options
      end
    end
  end
end
