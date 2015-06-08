require 'yaml'

module Trickery
  module Config

    include DeepOstruct

    def read_config(file)
      deep_ostruct(YAML.load(File.read(file)))
    end

  end
end
