# PART 1

allprograms = inp.lines.map{|l| l.split()[0]}
toremove = inp.lines.select{|l| l.include?(" -> ")}.map{|l| l.split(" -> ")[1].split(", ")}.flatten.map{|l| l.gsub("\n", '')}
puts "Part 1: #{(allprograms-toremove)[0]}"


# PART 2

@progs = inp.lines
def name(program)
  program.split[0].gsub("\n", '')
end  
@weights = {}
@children = {}
@progs.each do |p|
  name = name(p)
  @weights[name] = p.split[1].gsub('(', '').gsub(')', '').to_i
  w = []
  if p.include?("->")
    w = p.split(" -> ")[1].split(", ").map{|q| q.gsub("\n", '')}
  end
  @children[name] = w
end


def hasChildren(program)
  @children[program].size > 0
end  

base = "bsfpjtc"

def weightd(program)
  ini = @weights[program]
  
  if hasChildren(program)
    @children[program].each do |child|
      ini += weightd(child)
    end  
  end
  ini
end  

#Hacky... start with base and continue with conflicting children, until their own children are balanced. Then balance the father's weight
@children[base].each do |c|
  #puts weightd(c)
end  

puts "Part 2: #{@weights["utnrb"] -9}"
