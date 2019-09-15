class Prefecture < ActiveYaml::Base
  include ActiveHash::Associations
  set_root_path "app/models"
  has_many :addresses
end
