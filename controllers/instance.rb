# frozen_string_literal: true

require 'yaml'

require_relative '../logic/helpers/hash'
require_relative '../components/provider'
require_relative '../components/storage'
require_relative './interfaces/repl'
require_relative './interfaces/eval'
require_relative './session'

module NanoBot
  module Controllers
    class Instance
      def initialize(cartridge_path:, stream:, state: nil)
        @stream = stream

        load_cartridge!(cartridge_path)

        provider = Components::Provider.new(@cartridge[:provider])

        @session = Session.new(provider:, cartridge: @cartridge, state:, stream: @stream)
      end

      def debug
        @session.debug
      end

      def eval(input)
        Interfaces::Eval.evaluate(input, @cartridge, @session)

        return unless @stream.is_a?(StringIO)

        @stream.flush
        result = @stream.string.clone
        @stream.truncate(0)
        @stream.rewind
        result
      end

      def repl
        if @stream.is_a?(StringIO)
          @stream.flush
          @stream = $stdout
          @session.stream = @stream
        end
        Interfaces::REPL.start(@cartridge, @session)
      end

      private

      def load_cartridge!(path)
        elected_path = if path.strip == '-'
                         File.expand_path('../static/cartridges/default.yml', __dir__)
                       else
                         Components::Storage.cartridge_path(path)
                       end

        if elected_path.nil?
          @stream.write("Cartridge file not found: \"#{path}\"\n")
          raise StandardError, "Cartridge file not found: \"#{path}\""
        end

        @cartridge = Logic::Helpers::Hash.symbolize_keys(
          YAML.safe_load(
            File.read(elected_path),
            permitted_classes: [Symbol]
          )
        )

        inject_environment_variables!(@cartridge)
      end

      def inject_environment_variables!(node)
        case node
        when Hash
          node.each do |key, value|
            node[key] = inject_environment_variables!(value)
          end
        when Array
          node.each_with_index do |value, index|
            node[index] = inject_environment_variables!(value)
          end
        when String
          node.start_with?('ENV') ? ENV.fetch(node.sub(/^ENV./, ''), nil) : node
        else
          node
        end
      end
    end
  end
end
