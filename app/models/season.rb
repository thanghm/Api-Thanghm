class Season < ActiveRecord::Base
	has_many :players

  def self.create_from_csv name
    self.create(name: name)
  end
end
