require_relative '../modules/reconstruction'
require_relative '../modules/store_data'
require_relative '../modules/get_data'
require_relative '../modules/user_input'

class Helper
  extend UserInput
  extend Reconstruction
  extend StoreData
  extend GetData
end
