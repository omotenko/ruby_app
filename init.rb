
require_relative "app\\store_application"

StoreApplication.config do |app|
	app.name = "My Store"
	app.environment = :production
	app.admin do |admin|
		admin.email = "admin@mystore.com"
		admin.login = "admin"
		admin.send_info_emails_on :mondays
	end
end


cart=Cart.new(ARGV.delete_at(0))
cart.add_item(RealItem.new({:name=>ARGV[0], :price=>ARGV[1].to_i, :weight=>ARGV[2]}))
cart.add_item(RealItem.new({:name=>"car", :price=>200, :weight=>"100"}))

order = Order.new
cart.items.each {|i| order.add_item(i)}
#order.place
#p cart.all_cars
#cart.read_from_file
#begin
#	cart.save_to_file
#rescue Cart::ItemNotVirtual
#	puts "One of the items you're trying to save is not supported by the Cart.UNSUPPORTED ITEM classes are :"+
#	"#{Cart::UNSUPPORTED_ITEMS}"
#end


#cart.kind_of?(Cart) - является ли объект экземпляром класса
#cart.respond_to?(save_to_file) - принадлежит ли метод классу
#cart.send(save_to_file) - какой метод выполнить либо просмотреть параметры объекта