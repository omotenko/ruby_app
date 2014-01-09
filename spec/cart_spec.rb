require "rspec"
require_relative "..\\app\\item"
require_relative "..\\app\\antique_item"
require_relative "..\\app\\virtual_item"
require_relative "..\\app\\item_container"
require_relative "..\\app\\cart"

describe Cart do
	describe "managing items" do
		it "add items into cart" do
			cart = Cart.new("Oleg")
			item1 = Item.new(name:"kettle",price:200)
			item2 = Item.new(name:"car",price:100)
			cart.add_items(item1,item2)
			cart.items.should include(item1,item2)
		end
		it "removes items from itself"
	end
	
	it "counts items in itself"
	it "places order using all the items that were added into the cart"
	it "clears itself off the items after an order is placed"
end