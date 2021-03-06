require 'pp'
require 'mspec/helpers/io'
require 'mspec/helpers/scratch'

# Remove this when MRI has intelligent warnings
$VERBOSE = nil unless $VERBOSE

class MOSConfig < Hash
  def initialize
    self[:loadpath]  = []
    self[:requires]  = []
    self[:flags]     = []
    self[:options]   = []
    self[:includes]  = []
    self[:excludes]  = []
    self[:patterns]  = []
    self[:xpatterns] = []
    self[:tags]      = []
    self[:xtags]     = []
    self[:atags]     = []
    self[:astrings]  = []
    self[:target]    = 'ruby'
    self[:command]   = nil
    self[:ltags]     = []
    self[:files]     = []
    self[:launch]    = []
  end
end

def new_option
  config = MOSConfig.new
  return MSpecOptions.new("spec", 20, config), config
end

# Just to have an exception name output not be "Exception"
class MSpecExampleError < Exception
end

def hide_deprecation_warnings
  MSpec.stub(:deprecate)
end

def run_mspec(command, args)
  cwd = Dir.pwd
  cmd = "bin/mspec #{command} -B spec/fixtures/config.mspec #{args}"
  out = `#{cmd} 2>&1`
  out = out.sub(/\A\$.+\n/, '') # Remove printed command line
  out = out.sub(RUBY_DESCRIPTION, "RUBY_DESCRIPTION")
  out = out.gsub(/\d\.\d{6}/, "D.DDDDDD")
  out = out.gsub(cwd, "CWD")
end
