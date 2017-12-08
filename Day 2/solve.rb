num = 0
rows = inp.split("\n")

def est(row, cond)
    lar = 0
    lar = 13123123123 if cond == 0
    
    row.split(" ").each do |num|
      n = num.to_i
      lar = n if n > lar && cond==1
      lar = n if n < lar && cond==0
    end  
    lar
end  

def part1(rows)
  sum = 0
  rows.each do |row|
    sum += (est(row,1))-(est(row,0))
  end  
  sum
end

def part2(rows)
  sum = 0
  rows.each do |row|
    imap = row.split(" ").map(&:to_i).to_a.permutation(2).to_a
    
    imap.each do |comb|
      if comb[0] % comb[1] == 0 
        sum += comb[0]/comb[1]
        break
      end  
    end  
  end  
  puts sum
end  

puts part1(rows)
puts part2(rows)
