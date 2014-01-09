 require_relative "init"
 
 cart=Cart.new(ARGV.delete_at(0))
 ARGV.each do |a|
	 @items.each {|i| cart.add_item(i) if i.name == a}
 end
 p @items
 p cart.items