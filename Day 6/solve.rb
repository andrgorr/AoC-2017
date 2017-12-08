inp = "11	11 13	7	0	15 5 5 4 4 1 1 7 1 15	11"
@banks = {}
(0...inp.split.length).each do |i|
  @banks[i] = inp.split[i].to_i
end  
@seencombs = []

@cycles = 0

@firstrep = {}
@atpos = 0
@ii = 1

#Change part number to change part
@part = 1
def cycle(maxbankindex)
  value = @banks[maxbankindex]
  @banks[maxbankindex] = 0
  
  pos = maxbankindex + 1
  while value > 0 do
    if @banks[pos].nil?
      pos = 0
      next
    end  
    
    @banks[pos] = @banks[pos] + 1
    
    pos += 1
    value -= 1
  end

  if not @seencombs.include?(@banks)
    @seencombs << @banks.clone.freeze
    @cycles += 1
    cycle(@banks.max_by{|k,v| v}[0])
  else
    if @part == 2
      if @ii == 1
        @firstrep = @banks.clone.freeze
        @atpos = @cycles + 1
        @ii = 2
        @seencombs << @banks.clone.freeze
        @cycles += 1
        cycle(@banks.max_by{|k,v| v}[0])
      elsif @ii == 2 and @banks == @firstrep
        puts (@cycles + 1)-@atpos
      else 
        @seencombs << @banks.clone.freeze
        @cycles += 1
        cycle(@banks.max_by{|k,v| v}[0])
      end
    elsif @part == 1 
      puts @cycles + 1
    end
  end  
end  


cycle(@banks.max_by{|k,v| v}[0])
