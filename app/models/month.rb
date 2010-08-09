class Month
  
  MONTHS = ['january', 'february', 'march', 'april', 'may', 'june',
            'july', 'august', 'september', 'october', 'november', 'december']
  
  attr_accessor :name, :id
  
  def self.find_by_name(name)
    if MONTHS.include?(name)
      month = Month.new
      month.name = name
      month.id = sprintf('%.2d', MONTHS.index(name) + 1)
      month
    else
      nil
    end
  end
  
  def self.all
    months = []
    MONTHS.each do |name|
      months << self.find_by_name(name)
    end
    months  
  end
    
  def title
    self.name.split('-')[-1].capitalize
  end
  
  def path
    "/months/#{self.name}"
  end
  
  def display_path
    "/display/#{self.id}-#{self.name}.jpg"
  end
  
  def thumbnail_path
    "/thumbnails/#{self.id}-#{self.name}.jpg"
  end
  
end