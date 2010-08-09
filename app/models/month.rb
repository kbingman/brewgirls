class Month
  
  MONTHS = ['01-january', '02-february', '03-march', '04-april', '05-may', '06-june',
            '07-july', '08-august', '09-september', '10-october', '11-november', '12-december']
  
  attr_accessor :name
  
  def self.find_by_name(name)
    month = Month.new
    month.name = name
    month
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
    "/display/#{self.name}.jpg"
  end
  
  def thumbnail_path
    "/thumbnails/#{self.name}.jpg"
  end
  
end