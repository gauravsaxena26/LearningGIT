#hello_name.rb

class Chef::Recipe::Testgaurav
	def self.hello_name(name)
		puts "-"*50
		puts "Hello #{name}"
		puts "-"*50
	end
end