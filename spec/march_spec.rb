require 'spec_helper'

describe "March Runner" do
  it 'run with string all' do
    March.run(
    :helle => 'This is Hello',
    :work_1 => Proc.new{"this is work_1"}
    ) do |result|
      result.should == {:helle=>"This is Hello", :work_1=>"this is work_1"}
    end
  end
  
  it 'run with string and proc' do
    start_at = Time.now
    work_1 = Proc.new {
      sleep(2)
      Time.now
    }
    
    work_2 = Proc.new {
      sleep(3)
      Time.now
    }
    
    March.run(
    :work_1 => work_1,
    :work_2 => work_2
    ) do |result|
      (Time.now - start_at).should < 4
    end
  end
end