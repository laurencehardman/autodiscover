module Autodiscover
  class ServerVersionParser
    VERSIONS = {
      8 => {
        0 => 'Exchange2007',
        1 => 'Exchange2007_SP1',
        2 => 'Exchange2007_SP1',
        3 => 'Exchange2007_SP1',
      },
      14 => {
        0 => 'Exchange2010',
        1 => 'Exchange2010_SP1',
        2 => 'Exchange2010_SP2',
        3 => 'Exchange2010_SP2',
      },
      15 => {
        0 => 'Exchange2013',
        1 => 'Exchange2016',
      }
    }.freeze

    def initialize(hex_version)
      @version = hex_version.hex.to_s(2).rjust(hex_version.size*4, '0')
    end

    def major
      @version[4..9].to_i(2)
    end

    def minor
      @version[10..15].to_i(2)
    end

    def build
      @version[17..31].to_i(2)
    end

    def exchange_version
      v = VERSIONS[major][minor]
      v.nil? ? VERSIONS[8][0] : v
    end

  end
end
