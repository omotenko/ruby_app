require "rspec"
require_relative "..\\app\\Item"
require_relative "..\\app\\real_item"
require_relative "..\\app\\virtual_item"

describe RealItem do
	it "uses weight while returning info if the condition is true" do
		item1 = RealItem.new(name:"Kettle",price:100,weight:2)
		item2 = RealItem.new(name:"Kettle",price:100,weight:10)
		item1_info = []
		item2_info = []
		item1.info {|attr| item1_info << attr}
		item2.info {|attr| item2_info << attr}
		p item1_info.join(",")
		p item2_info.join(",")
	end
end