require 'spec_helper'

describe "the language" do

  include Crisp::SpecHelper

  before(:each) do
    @runtime = Crisp::Runtime.new
  end

  it "should not bother whitespaces, tabs and linebreaks in statements" do
    evaluate(" \r\t\n (\r+\t 1\n2 \t(\n - 9\r\t  \n   2)\r)\r\t   ").should == 10
  end
end