class Month
  
  MONTHS = ['january', 'february', 'march', 'april', 'may', 'june',
            'july', 'august', 'september', 'october', 'november', 'december']
  
  attr_accessor :name, :id
  
  def self.find_by_name(name)
    if MONTHS.include?(name)
      month = Month.new
      month.name = name
      month.id = MONTHS.index(name)
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
  
  def number
    sprintf('%.2d', self.id + 1)
  end
  
  def path
    "/months/#{self.name}"
  end
  
  def display_path
    "/display/#{self.number}-#{self.name}.jpg"
  end
  
  def thumbnail_path
    "/thumbnails/#{self.number}-#{self.name}.jpg"
  end
  
  def body
    text = File.read(root_path("app/views/text/#{name}.md")) rescue nil
    text ? Maruku.new(text).to_html : nil
  end
  
end