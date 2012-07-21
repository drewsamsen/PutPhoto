require "FileUtils"

def set_path_for(file)
  # use this path when this file sits in "Dropbox/Camera Uploads"
  # "/../Media/Drews Pictures" + modified_year(file) + "/" + modified_date(file)

  # use this path when testing in the same foulder as the script
  "./" + modified_date(file)
end

def modified_date(file)
  modified_month(file) + "-" + modified_day(file) + "-" + modified_year(file)
end

def modified_year(file)
  modified_time(file).strftime("%Y")
end

def modified_month(file)
  dt = modified_time(file).to_a
  dt[4].to_s
end

def modified_day(file)
  modified_time(file).strftime("%d")
end

def modified_time(file)
  File.mtime(file)
end

def directory_already_exists_at(path)
  File.exists?(path) && File.directory?(path)
end

def move_file(file,path)
  FileUtils.mv(file, path)
end

def make_directory(path)
  Dir.mkdir(path)
end

def file_exists?(file,path)
  file_location = path + "/" + file
  File.exists?(file_location)
end

def discard_file(file)
  if directory_already_exists_at("./duplicates") 
    move_file(file,"./duplicates")
  else
    make_directory("./duplicates")
    move_file(file,"./duplicates")
  end
end

Dir.glob('*.{jpg,jpeg,png,gif,mov}') do |file|
  path = set_path_for(file)
  #path_for_move = set_path_for
  if directory_already_exists_at(path)
    file_exists?(file,path) ? discard_file(file) : move_file(file,path)
  else
    make_directory(path)
    move_file(file,path)
  end
end


