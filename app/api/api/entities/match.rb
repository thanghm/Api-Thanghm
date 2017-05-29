module API
  module Entities
    class Match < Grape::Entity
      expose :id, documentation: { type: Integer, required: true, desc: 'ID of Match'}
      expose :match_code, documentation: { type: String, required: true, desc: 'Name of Match'}
      expose :player_name, as: :player, documentation: { type: String, required: true, desc: 'Player in Match'}
      expose :player_score, as: :score, documentation: { type: String, required: true, desc: 'Score in Match'}
      expose :venue, as: :match_in_venue,documentation: { type: String, required: true, desc: 'Match in Venue'}
      expose :get_time, as: :time, documentation: { type: String, required: true, desc: 'Time in Match'}
      expose :get_date, as: :date, documentation: { type: String, required: true, desc: 'Date of Match'}
      expose :status_name, as: :status, documentation: { type: String, required: true, desc: 'status of Match'}
      expose :player_gave_up, as: :player_gave_up, documentation: { type: String, required: true, desc: 'Player gave up in Match'}
    end
  end
end
