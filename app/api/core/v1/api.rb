module Core
  module V1
    class API < Grape::API
      version 'v1', using: :header, vendor: 'collector'
      format :json
      prefix :v1

      helpers do
        def authenticated?
          @current_user = User.find_by(authentication_token: params[:authentication_token])
        end
      end

      before do
        error!("401 Unauthorized", 401) unless authenticated?
      end

      resource :chunks do
        desc "Create a chunk."
        params do
          requires :content, type: String
          requires :public_ip, type: String
          requires :private_ip, type: String
        end

        post do
          @current_user.chunks.create!({
            content: params[:content],
            public_ip: params[:public_ip],
            private_ip: params[:private_ip]
          })
        end
      end
    end
  end
end
