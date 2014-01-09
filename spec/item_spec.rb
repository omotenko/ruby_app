require "rspec"
require_relative "..\\app\\Item"

describe Item do
	before(:each) do 
		@item = Item.new(price:100, name:"kettle")
	end
	
	before(:all) do
	begin
	
	after(:each){}
	
	after(:all){}
	
	it "Test class Item" do
		@item.price.should == 90
	end
	it "returns info about items" do
		@item.to_s.should == "kettle:90.0"
	end
end