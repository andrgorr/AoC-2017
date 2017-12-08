#Input
    num = 9866876
    
    #Calculate what "level" or "step" of the spiral the desired number is at
    #Max number of each level (level n) follows the series f(n) = 4n² - 4n + 1
    niv = 0
    (1..10**11).each do |n|
      if (4*(n**2) - 4*n + 1) > num
        niv = n
        break
      end  
    end  
    
    #Calculate what side of the square the number is at (0,1,2,3)
    ks = 0
    mnn = (4*((niv-1)**2) - 4*(niv-1) + 1)+1
    (1..4).each do |k|
      if mnn + k*2*(niv-1) >= num
        ks = k
        break
      end  
    end  
    
    # First number in the appropriate side of the square (counting vertices as the last number
    # of the last side)
    fst = mnn + (ks-1)*2*(niv-1)
    # Central number of the side of the square (average of adjacent vertices value)
    half = ((fst-1)+((mnn + ks*2*(niv-1))-1))/2
    # Knowing that the steps needed to get from the center of the square's side is (level-1) - counting entry point as level 1 - and that the steps grow in augments of 1 for each position moved; Calculate total steps by adding difference between number and central number, to the center steps needed.
    out = (niv-1) + (num-half)
    
    puts "#{out} steps"
