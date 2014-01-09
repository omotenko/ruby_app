class Item
  
	@@discount = 0.1
	
	def self.discount
		if Time.now.month == 4
			@@discount+=0.2
		else
		  @@discount
		end
	end
	
	def self.show_info_about(attr,block)
		@@show_info_about ||={}
		@@show_info_about[attr] = block
	end
	def initialize(options={})
		@price=options[:price]
		@name=options[:name]
	end
  attr_reader :price, :name
	attr_writer :price
	
	def info
	  yield(price)
		yield(name)
	end
	
	def to_s
		"#{self.name}:#{self.price}"
	end
	def price
		(@price - @price*self.class.discount) if @price
	end
	
end