require 'sinatra'
require 'sinatra/reloader'

# 65-90 upper
# 97-122

def caesar_cyper(string, num)
  new_string = string.split("").map do |char|
    if char.ord >= 65 && char.ord <= 90
      char = (((char.ord + num - 65) % 26) + 65).ord
    elsif char.ord >= 97 && char.ord <= 122
      char = (((char.ord + num - 97) % 26) + 122).ord
    else
      char = char
    end
  end

  puts new_string.to_s

end


  