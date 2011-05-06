module JSend
  module Rails
    class Envelope
      STATUS = [:error, :fail, :success]

      def self.compute(options_or_status)
        if options_or_status.is_a?(Hash)
          if options_or_status.include?(:error)
            p = {:status => :error, :message => options_or_status[:error]}
            p[:code] = options_or_status[:code] if options_or_status.include?(:code)
            p[:data] = options_or_status[:data] if options_or_status.include?(:data)
            p
          elsif options_or_status.include?(:fail)
            {:status => :fail, :data => options_or_status[:fail]}
          elsif options_or_status.include?(:success)
            {:status => :success, :data => options_or_status[:success]}
          else
            raise ArgumentError.new("one of #{STATUS.join(', ')} required")
          end
        else
          raise ArgumentError.new("one of #{STATUS.join(', ')} required") unless STATUS.include?(options_or_status)
          {:status => options_or_status, :data => {}}
        end
      end
    end
  end
end
