# ===========================================================================
# To run the script:
#
#  1) Put this file, putphoto.rb, into "Dropbox/Camera Uploads" or any folder that is
#     a direct child of Dropbox/
#  2) Put files to be organized in the same folder as step 1 (jpg,jpeg,png,gif,mov)
#  3) Ensure that the correct path is uncommented in method "set_path_for"
#  4) Run the script from command prompt using "ruby putphoto.rb"
#  5) ??????
#  6) PROFIT.
#
# ===========================================================================

PATH_BASE = "../Media/Drews Pictures"

require "FileUtils"

# The first method sets the destination path for where the file needs to end up.
# Notice that there are two paths here - one for testing and one for actually making
# the move to my "/Media/Drews Pictures" folders.

def set_path_for(file)
  # PRODUCTION USE - use this path when this file sits in "Dropbox/Camera Uploads"
  PATH_BASE + "/" + modified_year(file) + "/" + modified_date(file)

  # TESTING USE - use this path when testing in the same foulder as the script
  # "./" + modified_date(file)
end


# Puts together the modified date of a file in the format of M-D-YYYY
# (no padding zeroz on month or day value)

def modified_date(file)
  modified_month(file) + "-" + modified_day(file) + "-" + modified_year(file)
end


# Returns the year of file modification in "YYYY"

def modified_year(file)
  modified_time(file).strftime("%Y")
end


# the following is a hack. To remove the padding zero from
# the month number, I first convert the Time object to an array
# and then convert the month element to a string. In Ruby v1.9.3
# this can be done with strftime("%-m")

def modified_month(file)
  month = modified_time(file).to_a
  month[4].to_s
end


# the following is a hack. To remove the padding zero from
# the day number, I first convert the Time object to an array
# and then convert the day element to a string. In Ruby v1.9.3
# this can be done with strftime("%e")

def modified_day(file)
  day = modified_time(file).to_a
  day[3].to_s
end


# This method gets a Time object of when the file was last modified
# Since I organize my photos by date, this is used to know where
# to move the file later

def modified_time(file)
  File.mtime(file)
end


# After knowing where the file needs to ultimately end up, we first
# check to see if that directory already exists.

def directory_already_exists_at(path)
  File.exists?(path) && File.directory?(path)
end


# The actual moving of the file to it's new directory. Same file name.

def move_file(file,path)
  FileUtils.mv(file, path)
end


# Make the directory for the file's year if needed

def make_year_directory(file)
  year_path = PATH_BASE + "/" + modified_year(file)
  unless directory_already_exists_at(year_path)
    puts "Making YEAR directory: #{year_path}"
    Dir.mkdir(year_path)
  end
end


# Create a destination folder if it does not exist already

def make_directory(path)
  puts "Making directory: #{path}"
  Dir.mkdir(path)
end


# This is a check to make sure the file doesn't already exist at the destination.

def file_exists?(file,path)
  file_location = path + "/" + file
  File.exists?(file_location)
end


# This moves duplicate files into a new directory called "duplicates"

def discard_file(file)
  if directory_already_exists_at("./duplicates")
    move_file(file,"./duplicates")
  else
    make_directory("./duplicates")
    move_file(file,"./duplicates")
  end
end


# Finally, here is where the script is executed!
# Notice that I am moving various image files as well as iPhone video clips (.mov)
# since I use this script primarily to organize files from my iPhone

Dir.glob('*.{jpg,jpeg,png,gif,mov}') do |file|
  path = set_path_for(file)
  if directory_already_exists_at(path)
    file_exists?(file,path) ? discard_file(file) : move_file(file,path)
  else
    make_year_directory(file)
    make_directory(path)
    move_file(file,path)
  end
end