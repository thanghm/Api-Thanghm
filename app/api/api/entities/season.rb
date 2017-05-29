module API
  module Entities
    class Season < Grape::Entity
      expose :id, documentation: { type: Integer, required: true, desc: 'ID of Season'}
      expose :season_name, documentation: { type: String, required: true, desc: 'Name of Season'}
    end
  end
end

