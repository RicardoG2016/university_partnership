module GroupsHelper

  def csv_parser
    file = "lib/list.csv"
    
    data = []
    CSV.foreach(file, :headers => true) do |row|
      data << row.to_h
    end
    
    return data
    
  end

  def school_list
    schools = []
    csv_parser.map do |line| 
      schools << line['name']       
    end
    return schools
  end

  def school_url(school)
    csv_parser.map do |row| 
      if row['name'] == school
        url = row['url']
        return url[11..-1]
      end
    end
  end

end
