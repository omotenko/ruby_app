module ItemContainer
	
	module ClassMethods
		
		def min_price
			100
		end
	end
	
	module InstanceMethods
		
		attr_reader:items
		
		def add_item(item)
		  #if item.price < self.class.min_price
				@items.push item
	    #end
	 
	  end
	  
		def method_missing(method_name)
			if method_name =~ /^all_/
				show_all_items_with_name(method_name.to_s.sub(/^all_/,'').chomp('s'))
			else
				super
			end
		end
		def remove_item
		  @items.pop
	  end

	  def validate
		  @items.each {|i|  puts "Has not price" if i.price.nil?}
	  end
	 
	  def delete_valid_item
		  @items.delete_if{|i| i.price.nil?}
	  end
  
		def count_valid_info
			@items.count{|i| i.price}
		end
		
		def show_all_items_with_name(n)
			@items.map { |i| i if n == i.name}.delete_if { |i| i.nil? }
		end 
		
	end
	
	def self.included(base)
		base.extend ClassMethods
		base.class_eval do
			include InstanceMethods
		end
	end
end