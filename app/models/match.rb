class Match < ActiveRecord::Base
	enum status: { completed: 1}
	scope :completed, -> {where("status = ?", statuses[:completed])}

  belongs_to :home_player, :class_name => Player, :foreign_key => "home_player_id"
  belongs_to :away_player, :class_name => Player, :foreign_key => "away_player_id"

  def self.matchs_search options = {}
    if options[:season_name].blank? && options[:player_name].blank?
      result = self.all
    else
      if options[:season_name].present?
      	players = Player.includes(:season).where("players.player_name like ? AND seasons.name like ?", "%#{ options[:player_name] }%", "%#{ options[:season_name] }%")
      else
        players = Player.where("players.player_name like ? ", "%#{ options[:player_name] }%")
      end  
      player_id = players.pluck(:id)
      result = self.where("home_player_id IN (?) OR away_player_id IN (?)", player_id, player_id)
    end
    result.page(options[:page])
  end

  def season_name
    if self.home_player && self.away_player
      self.home_player.season.name
    end
  end

  def player_name
  	if self.home_player && self.away_player
  		string = ""
	  	string << self.home_player.player_name
	  	string << " VS "
	  	string << self.away_player.player_name
	  	return string
	  end
  end

  def player_score
		string = ""
		string << self.home_player_score.to_s
  	string << " - "
  	string << self.away_player_score.to_s
		return string
  end

  def player_gave_up
  	result = ""
		if self.player_id_gave_up == self.home_player_id
			result = self.home_player.player_name
		elsif self.player_id_gave_up == self.away_player_id
			result = self.away_player.player_name
		else
			result
  	end
  	return result
  end

  def status_name
  	self[:status]
  end

  def get_date
  	self.date.strftime('%d/%m/%Y')
  end

  def get_time
  	self.datetime.strftime('%H:%M:%S')
  end
end
