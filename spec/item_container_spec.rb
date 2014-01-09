require "rspec"
require_relative "..\\app\\item"
require_relative "..\\app\\virtual_item"
require_relative "..\\app\\item_container"

class ItemBox
	include ItemContainer
	
	def initialize
		@items = []
	end
end
describe ItemContainer do
	before(:each) do
		@box = ItemBox.new
		@item1 = Item.new(name:"kettle",price:200)
		@item2 = Item.new(name:"kettle",price:300)
	end
	
	it "items adds into the container" do
		@box.add_item(@item1)
		@box.add_item(@item2)
		@box.items.should have(2).items
	end
	
	it "removes item from the box" do
		@box.add_item(@item1)
		@box.add_item(@item2)
		@box.remove_item.should be(@item2)
		@box.remove_item
		@box.items.should be_empty
	end
	
	it "raises error if user is trying to add
anything else but an item" do
		lambda {@box.add_item("something else")}.should
		raise_error
	end
end