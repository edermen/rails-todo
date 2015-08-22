require 'rails_helper'

describe List do
  before { @list = List.new( name: "First list" ) }
  subject { @list }
  #Valid name
  it { should respond_to :name }

  describe "short name" do
    before { @list.name = " " }
    it { should_not be_valid }
  end
  describe "long name" do
    before { @list.name = 'a' *61}
    it { should_not be_valid } 
  end
end
