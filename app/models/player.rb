class Player < ActiveRecord::Base
  has_many :home_matches, :class_name => Match, :foreign_key => "home_player_id" do
    def wins
      where("status = ? AND home_player_score > away_player_score OR player_id_gave_up = away_player_id", Match.statuses[:completed])
    end
    def losses
      where("status = ? AND home_player_score < away_player_score OR player_id_gave_up = home_player_id", Match.statuses[:completed])
    end
    def gave_ups
      where("status = ? AND player_id_gave_up = home_player_id", Match.statuses[:completed])
    end
  end

  has_many :away_matches, :class_name => Match, :foreign_key => "away_player_id" do
    def wins
      where("status = ? AND home_player_score < away_player_score OR player_id_gave_up = home_player_id", Match.statuses[:completed])
    end
    def losses
      where("status = ? AND home_player_score > away_player_score OR player_id_gave_up = away_player_id", Match.statuses[:completed])
    end
    def gave_ups
      where("status = ? AND player_id_gave_up = away_player_id", Match.statuses[:completed])
    end
  end

  belongs_to :group
  belongs_to :season

  def self.import_csv(name, player_1, player_2, group, match_code, time, date, venue, score)
    if group.present?
      player_id_gave_up = 0
      season_id = Season.find_by(name: name).id
      group_name = group.gsub(/[^A-Z]/i,"")
      group = Group.find_by(letter: group_name)
      if group.blank?
        group = Group.create(letter: group_name)
      end
      # Find Player A(Home)
      player_a = self.find_by(player_name: player_1, season_id: season_id)
      if player_a.blank?
        player_a = self.create(player_name: player_1, season_id: season_id, group_id: group.id)
      end
      # Find Player B(Away)
      player_b = self.find_by(player_name: player_2, season_id: season_id)
      if player_b.blank?
        player_b = self.create(player_name: player_2, season_id: season_id, group_id: group.id)
      end
      # check player gave up
      if score.include?('gave up')
        gave_up_name = score.gsub(" gave up","")
        if player_a.player_name == gave_up_name
          player_id_gave_up = player_a.id
        else 
          player_id_gave_up = player_b.id
        end
      end
      score_1 = score.split("-")[0].to_i
      score_2 = score.split("-")[1].to_i
      # Find matches
      match = Match.find_by(match_code: match_code, home_player_id: player_a.id, away_player_id: player_b.id)
      if match.blank?
        match = Match.create(match_code: match_code, datetime: time, date: date, venue: venue, home_player_score: score_1, away_player_score: score_2, home_player_id: player_a.id, away_player_id: player_b.id, player_id_gave_up: player_id_gave_up, status: Match.statuses[:completed])
      end
    end
  end

  def season_name
    self.season.name if self.season
  end

  def self.search options = {}
    query = ""
    query << " LCASE(player_name) LIKE '%#{ options[:search_text] }%' "
    where(query).order(id: :asc).page(options[:page])
  end

  def matches
    Match.where("home_player_id = ? OR away_player_id = ?", self.id, self.id)
  end

  def home_wins
    self.home_matches.wins.count
  end

  def home_goals_for
    self.home_matches.completed.sum(:home_player_score)
  end

  def away_goals_for
    self.away_matches.completed.sum(:away_player_score)
  end

  def home_goals_against
    self.home_matches.completed.sum(:away_player_score)
  end

  def away_goals_against
    self.away_matches.completed.sum(:home_player_score)
  end

  def away_wins
    self.away_matches.wins.count
  end

  def home_losses
    self.home_matches.losses.count
  end

  def away_losses
    self.away_matches.losses.count
  end

  def home_gave_ups
    self.home_matches.gave_ups.count
  end

  def away_gave_ups
    self.away_matches.gave_ups.count
  end

  def player_draws
    self.matches.where("status = ? AND home_player_score = away_player_score AND player_id_gave_up = 0", Match.statuses[:completed]).count
  end

  def player_wins
    self.home_wins + self.away_wins
  end

  def player_losses
    self.home_losses + self.away_losses
  end

  def player_gave_up
    self.home_gave_ups + self.away_gave_ups
  end

  def player_goals_for
    self.home_goals_for + self.away_goals_for
  end

  def player_goals_against
    self.home_goals_against + self.away_goals_against
  end

  def goal_differential
    self.player_goals_for - self.player_goals_against
  end

  def player_points
    self.player_wins * 3 + self.player_draws
  end

  def games_played
    self.player_wins + self.player_losses + self.player_draws
  end
end
