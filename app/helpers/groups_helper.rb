module GroupsHelper

  def group_options
    data_file = "lib/list.csv"
    
    data = []
    CSV.foreach(data_file, :headers => true) do |row|
      data << row.to_h
    end
    
    schools = []
    info =[]
    
    data.each do |s|
      # urls << s['urls']
      # info << urls

      schools << s['name']
      info << schools
    # binding.pry
    end


    return info

  end

  def urls
    # return group_options[0]
  end


end
