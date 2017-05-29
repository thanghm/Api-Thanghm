module API
  module Entities
    class User < Grape::Entity
      expose :id, documentation: { type: Integer, required: true, desc: 'ID of user.'}
      expose :email, documentation: { type: String, required: true, desc: 'Email of user.'}
      expose :authentication_token, documentation: { type: 'string', desc: 'Access token of user.' }
    end
  end
end