class Captain < ActiveRecord::Base
  has_many :boats

  def Captain.catamaran_operators
    Captain.includes(boats: :classifications).where(classifications: {name: "Catamaran"}).uniq
  end

  def Captain.motorboat_operators
    Captain.includes(boats: :classifications).where(classifications: {name: "Motorboat"} ).uniq
  end

  def Captain.talented_seafarers
    Captain.where('id in (?)', Captain.sailors.pluck(:id) & Captain.motorboat_operators.pluck(:id))
  end

  def Captain.non_sailors
    Captain.where('id not in (?)', Captain.sailors.pluck(:id))
  end
end
