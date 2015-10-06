#name_file.rb
actions :create, :remove

attribute :title, kind_of: String, default: "title"
attribute :name, kind_of: String, default: "name"
attribute :path, kind_of: String