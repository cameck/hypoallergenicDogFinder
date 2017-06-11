require 'logger'

# Basic logging setup
module Logging
  def self.setup(class_name)
    @logger = Logger.new(STDOUT).tap { |log| log.progname = class_name }
    @logger.level = Logger::INFO
    @logger
  end
end
