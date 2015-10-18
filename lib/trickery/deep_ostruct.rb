require 'ostruct'

module Trickery
  module DeepOstruct

    def deep_ostruct(values)
      case values
      when Hash
        OpenStruct.new.tap do |o|
          values.each do |key, value|
            o.send key.to_s + '=',
                   deep_ostruct(value)
          end
        end
      when Array
        values.map { |v| deep_ostruct(v) }
      else values
      end
    end

  end
end
