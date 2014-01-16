#
# March.run({
#   
# }) do |result|
#
# end
#
require "march/runner"
module March
  def self.run *args, &block
    runner = ::March::Runner.new
    runner.run(*args, &block)
  end
end
