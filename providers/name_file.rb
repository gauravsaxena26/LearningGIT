#name_file.rb

action :create do
	file new_resource.path do
		content "#{new_resource.title} ---- #{new_resource.name}"
		action :create
	end
end

action :remove do
	file new_resource.path do
		action :delete
	end
end