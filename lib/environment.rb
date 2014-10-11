# Environment singleton which will hold various objects that should
# be accessible all across the app
class Environment
  class << self
    attr_accessor :logger
  end
end
