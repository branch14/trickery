require 'optparse'
require 'yaml'

require File.expand_path('../hash/new_nested', __FILE__)
require File.expand_path('../hash/deep_merge', __FILE__)

module Trickery
  class Configurability < Struct.new(:prefix, :fields)

    def default_opts
      @default_opts ||= nested_hash.tap do |opts|
        fields.each do |field|
          names = field[2].split('.')
          value = opts
          names.each do |name|
            if name == names.last
              value[name] = field[3]
            else
              value = value[name]
            end
          end
        end
      end
    end

    def cli_opts(args)
      @cli_opts ||= nested_hash.tap do |opts|
        args.options do |o|
          fields.each do |field|
            o.on(field[0], field[1]+'=val', String) do |val|
              names = field[2].split('.')
              value = opts
              names.each do |name|
                if name == names.last
                  value[name] = val
                else
                  value = value[name]
                end
              end
            end
          end
          o.parse!
        end
      end
    end

    def env_opts
      @env_opts ||= nested_hash.tap do |opts|
        fields.each do |field|
          env = (prefix+'.'+field[2]).upcase.tr('.', '_')
          if val = ENV[env]
            names = field[2].split('.')
            value = opts
            names.each do |name|
              if name == names.last
                value[name] = val
              else
                value = value[name]
              end
            end
          end
        end
      end
    end

    def file_opts(file)
      return {} unless File.exist?(file)
      YAML.load(File.read(file))
    end

    def digest(args)
      opts = default_opts.deep_merge(env_opts, cli_opts(args))
      file = opts['configfile']
      default_opts.deep_merge(file_opts(file), env_opts, cli_opts(args))
    end

  end
end
