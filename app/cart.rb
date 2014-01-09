class Cart
 
 attr_reader :items
 
 include ItemContainer
 class ItemNotVirtual < StandardError 
 end
 def initialize(owner)
	 @items=Array.new
	 @owner=owner
 end
 UNSUPPORTED_ITEMS = [AntiqueItem,VirtualItem]
 def save_to_file
	 File.open("#{@owner}_cart.txt","w") do |f|
		 @items.each do |i| 
			 raise ItemNotVirtual if UNSUPPORTED_ITEMS.include?(i.class)
			 f.puts i
		   end
		end
	end
 def read_from_file
   #return unless File.exists?("#{@owner}_cart.txt") 
	 File.readlines("#{@owner}_cart.txt").each {|i| @items << i.to_real_item}
	 @items.uniq!
 rescue #класс ошибки
	 File.open("#{@owner}_cart.txt","w")
	 puts "File #{@owner}_cart.txt created"
 end
 def add_items(*items)
	@items +=items
 end
 end