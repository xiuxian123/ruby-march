require 'spec_helper'

describe "" do
  it '' do
    March.run(
    :helle => 'This is Hello',
    :work_1 => Proc.new{"this is work_1"}
    ) do |result|
      result.should == {:helle=>"This is Hello", :work_1=>"this is work_1"}
    end
  end
  
  it '' do
    start_at = Time.now
    work_1 = Proc.new {
      sleep(5)
      Time.now
    }
    
    work_2 = Proc.new {
      sleep(5)
      Time.now
    }
    
    March.run(
    :work_1 => work_1,
    :work_2 => work_2
    ) do |result|
      pp start_at
      result.should == {}
    end
  end
end