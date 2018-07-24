class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    Boat.joins(:classifications)
  end
end
