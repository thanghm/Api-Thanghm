module API
  module Entities
    class Player < Grape::Entity
      expose :id, documentation: { type: Integer, required: true, desc: 'ID of Player'}
      expose :player_name, as: :player, documentation: { type: String, required: true, desc: 'Name of Player'}
    	expose :player_points, as: :points, documentation: { type: Integer, required: true, desc: 'Point of Player'}
    	expose :player_wins, as: :wins, documentation: { type: Integer, required: true, desc: 'Match wins of Player'}
      expose :player_draws, as: :draws, documentation: { type: Integer, required: true, desc: 'Match draws of Player'}
    	expose :player_losses, as: :losses, documentation: { type: Integer, required: true, desc: 'Match losses of Player'}
      expose :player_gave_up, as: :gave_up, documentation: { type: Integer, required: true, desc: 'Match gave up of Player'}
    end
  end
end