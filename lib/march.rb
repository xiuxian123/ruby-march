#
# March.run({
#   
# }) do |result|
#
# end
#
require 'thread'
class March
  def self.run *args, &block
    self.new.run(*args, &block)
  end
  
  def run *args, &block
    options = args.last.is_a?(::Hash) ? args.pop : {}
    
    result = {}
    runners = {}
    
    options.each do |key, value|
      case value
      when ::Proc
        runners[key] = value
      else
        result[key] = value
      end
    end
    
    runners_count = runners.size
    finished_runners_count = 0

    threads = []
    
    runners.each do |name, proc|
      threads << Thread.new do
        result[name] = proc.call
    
        finished_runners_count += 1
        if finished_runners_count >= runners_count
          if block_given?
            block.call(result)
          else
            result
          end
        end
      end
    end
    
    threads.each do |thr|
      thr.join
    end
  end 
end
