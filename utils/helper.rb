require_relative '../modules/reconstruction'
require_relative '../modules/store_data'
require_relative '../modules/get_data'
require_relative '../modules/user_input'

module HelperMethods
  include Reconstruction
  include StoreData
  include GetData
  include UserInput
end
