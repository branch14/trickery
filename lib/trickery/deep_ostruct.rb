require 'ostruct'

module Trickery
  module DeepOstruct

    def deep_ostruct(opts)
      OpenStruct.new.tap do |o|
        opts.each do |key, value|
          o.send key.to_s + '=',
                 case value
                 when Hash
                   deep_ostruct(value)
                 when Array
                   value.map { |v| deep_ostruct(v) }
                 else value
                 end
        end
      end
    end

  end
end
