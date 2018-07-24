class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    Captain.where(:boats)
  end
end
