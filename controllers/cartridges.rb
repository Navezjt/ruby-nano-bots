# frozen_string_literal: true

require_relative '../components/storage'
require_relative '../logic/helpers/hash'
require_relative '../logic/cartridge/default'
require_relative '../logic/cartridge/parser'

module NanoBot
  module Controllers
    class Cartridges
      def self.load(path)
        Logic::Cartridge::Parser.parse(File.read(path), format: File.extname(path))
      end

      def self.all
        files = {}

        path = Components::Storage.cartridges_path

        Dir.glob("#{path}/**/*.{yml,yaml,markdown,mdown,mkdn,md}").each do |file|
          files[Pathname.new(file).realpath] = {
            base: path,
            path: Pathname.new(file).realpath
          }
        end

        cartridges = []

        files.values.uniq.map do |file|
          cartridge = load(file[:path]).merge(
            {
              system: {
                id: file[:path].to_s.sub(
                  /^#{Regexp.escape(file[:base])}/, ''
                ).sub(%r{^/}, '').sub(/\.[^.]+\z/, ''),
                path: file[:path],
                base: file[:base]
              }
            }
          )

          next if cartridge[:meta][:name].nil?

          cartridges << cartridge
        rescue StandardError => _e
        end

        cartridges = cartridges.sort_by { |cartridge| cartridge[:meta][:name] }

        cartridges.prepend(
          { system: { id: '-' }, meta: { name: 'Default', symbol: '🤖' } }
        )

        cartridges
      end
    end
  end
end
