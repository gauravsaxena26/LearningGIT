#create_file_content.rb

define :create_file_content, :name => 'test', :content => 'content' , :extn => '.txt' do
	file "Creating file" do
		path		"#{params[:name]}#{params[:extn]}"
		content 	"#{params[:content]}"
		action 		:create
	end
end