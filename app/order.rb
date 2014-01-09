class Order

 attr_reader :items
 
 include ItemContainer
 
 def initialize
	 @items=Array.new
 end

 def place
  thr = Thread.new do
    Pony.mail(:to => 'o.motenko@mail.ru',  
	      :from => 'My Store',
			:via => :smtp, :via_options => {
			  :address              => 'smtp.gmail.com',
			  :port                 => '587',
			  :enable_starttls_auto =>  true,
			  :user_name            => 'motenko77@gmail.com',
			  :password             => 'motenko5186258oleg',
			  :authentication       => :plain,
			  :domain               => "mail.google.com" },
	  subject:  'New order has been placed',
	     body:  'Please check back to admin to see it')
	end
	while (thr.alive?) do
		print "."
		sleep(1)
	end
	puts "Email sent!"
 end
end