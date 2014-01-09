class String
	def to_real_item
	 field = self.chomp
	 field = field.split(":")
	 RealItem.new(name:field[0],price:field[1].to_i,weight:field[2])
	end
end