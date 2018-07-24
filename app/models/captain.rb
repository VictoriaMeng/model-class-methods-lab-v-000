class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    Captain.joins(:boats, :classifications)
  end
end
