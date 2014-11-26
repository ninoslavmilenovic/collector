module Core
  class API < Grape::API
    mount Core::V1::API
  end
end