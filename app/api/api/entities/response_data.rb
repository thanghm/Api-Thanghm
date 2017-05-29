module API
  module Entities
    class ResponseData < Grape::Entity
      expose :is_success, documentation: { type: 'boolean', desc: 'Success or fail' }
      expose :message, documentation: { type: 'string', desc: 'Message' }
      expose :data, documentation: { type: 'Hash', desc: 'Return data' }
    end
  end
end