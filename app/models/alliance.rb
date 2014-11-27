class Alliance < ActiveRecord::Base

  self.primary_key =  'grepo_id'

  # Associations
  has_many :players
  has_many :towns, through: :players
  
  # Params
  def to_param
    "#{self.id}-#{self.name.downcase.gsub(" ", "-")}"
  end

  # Ocean Percentages
  def ocean_percentage
    return @ocean_percentage if defined? @ocean_percentage 
    ocean_town_counts = towns.group(:ocean).count 
    total_cities = ocean_town_counts.values.sum.to_f 

    @ocean_percentage = ocean_town_counts.map {|ocean, count| [ocean, (count / total_cities * 100).round(2)]}.to_h
  end

end
