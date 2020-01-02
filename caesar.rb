require 'sinatra'

# 65-90 upper
# 97-122
def caesar_cipher(phrase, offset)
  cipher = ""
  lc_alpha = "abcdefghijklmnopqrstuvwxyz"
  uc_alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  phrase.split("").map do |char|
    if lc_alpha.include?(char)
      cipher.concat << lc_alpha.chars[(lc_alpha.index(char).to_i + offset) % 26]
    elsif uc_alpha.include?(char)
      cipher.concat << uc_alpha.chars[(uc_alpha.index(char).to_i + offset) % 26]
    else
      cipher.concat << char
    end
  end
  cipher
end


get '/' do
  $secret = params['secret']
  $shift = params['shift'].to_i
  $encoded = caesar_cipher($secret, $shift)
  erb :index,{ :locals => params, :secret => $secret, :shift => $shift, :encoded => $encoded }
end

  