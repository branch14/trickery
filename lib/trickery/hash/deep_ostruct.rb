require 'ostruct'

class ::Hash

  def deep_ostruct
    OpenStruct.new.tap do |o|
      each do |key, value|
        o.send key.to_s + '=',
               case value
               when Hash, Array
                 value.deep_ostruct
               else value
               end
      end
    end
  end

end

class ::Array

  def deep_ostruct
    map do |v|
      case value
      when Hash, Array
        value.deep_ostruct
      else value
      end
    end
  end

end
