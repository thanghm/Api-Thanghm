module API
  module Entities
    class Error < Grape::Entity
      expose :is_success, documentation: { type: 'boolean', desc: 'Success or fail' }
      expose :code, documentation: { type: 'string', desc: 'Error code' }
      expose :message, documentation: { type: 'string', desc: 'Error message' }
    end
  end
end