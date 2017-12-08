lines = str.lines
valid = 0 
lines.each do |line|
  words = line.split
  combs = []
  words.each do |word|
    word.chars.permutation(word.length).to_a.uniq.each do |per|
      combs << per.join.to_s
    end  
  end  
  valid += 1 if combs.length == combs.uniq.length
end  
puts valid
