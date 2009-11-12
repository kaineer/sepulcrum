#
module Utils
  module Colors
    def self.esc( code )
      "\e[#{code}m"
    end

    RED       = esc "31"
    GREEN     = esc "92"
    YELLOW    = esc "33"
    DARK_GRAY = esc "90"
    BLUE      = esc "34"
    RESET     = esc "0"

    def red( text )
      "%s%s%s" % [ RED, text, RESET ]
    end

    def green( text )
      "%s%s%s" % [ GREEN, text, RESET ]
    end

    def yellow( text )
      "%s%s%s" % [ YELLOW, text, RESET ]
    end
  end

  module Log
    def timestamp
      Time.now.strftime( "%Y.%m.%d -- %H:%M:%S" )
    end

    def log( level, message, color )
      puts "%s [%s%-5s%s] %s" % 
        [ timestamp, color, level.upcase, Utils::Colors::RESET, message ]
    end

    def error( message )
      log( "error", message, Utils::Colors::RED )
    end

    def debug( message )
      log( "debug", message, Utils::Colors::DARK_GRAY )
    end

    def warn( message )
      log( "warn", message, Utils::Colors::YELLOW )
    end

    def info( message )
      log( "info", message, Utils::Colors::BLUE )
    end
  end

  module File
    
  end
end
