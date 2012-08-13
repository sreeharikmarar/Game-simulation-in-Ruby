
class Animals
    attr_accessor :name
    attr_accessor :position
    
    def initialize(name,direction,position)
        @name      =name
	@direction = direction
	@position = position
    end
    def move
       
	if @direction=="N" and @position[1]<10 
	    puts("#{@name} #{@direction} #{@position}")
	    @position[1]+=1
                	  
	elsif @direction == "S" and @position[1] >1 
	    puts("#{@name} #{@direction} #{@position}")
	    @position[1]-=1
	  	        
	elsif @direction == "E" and @position[0] < 10 
	    puts("#{@name} #{@direction} #{@position}")
	    @position[0]+=1
	   		   
	elsif @direction == "W" and @position[0] > 1 
	    puts("#{@name} #{@direction} #{@position}")
	    @position[0]-=1
	 
	else
	    @direction = self.turn
        end
    end
    def jumb
       
	if @direction=="N" and @position[1] < 9 
	    puts("#{@name} #{@direction} #{@position}")
	    @position[1]+=2
                	  
	elsif @direction == "S" and @position[1] > 2 
	    puts("#{@name} #{@direction} #{@position}")
	    @position[1]-=2	 	
        
	elsif @direction == "E" and @position[0] < 9 
	    puts("#{@name} #{@direction} #{@position}")
	    @position[0]+=2	   	
	   
	elsif @direction == "W" and @position[0] > 2 
	    puts("#{@name} #{@direction} #{@position}")
	    @position[0]-=2	 
	else
	    @direction = self.turn
        end
    end
    def turn
        if @direction == 'N' 
            seq = ['E','W','S']	    
            item = seq[rand(seq.length)]
       	    return item
        
	elsif @direction == 'S' 
	    seq = ['E','W','S']	    
            item = seq[rand(seq.length)]
       	    return item
        
	elsif @direction == 'E' 
            seq = ['E','W','S']	    
            item = seq[rand(seq.length)]
       	    return item
       
	else
            seq = ['E','W','S']	    
            item = seq[rand(seq.length)]
       	    return item
        end
    end
    def eat(name)
	puts "*********** #{name} get eaten ************ \n"
    end
end
   
class Worm < Animals

     def initialize( name, direction, position )
          super( name,direction,position )
     end
     def move
       self.class.superclass.instance_method(:move).bind(self).call
     end
     def eat(name)
       self.class.superclass.instance_method(:eat).bind(self).call(name)
     end
     
end

class GrassHoper < Animals

     def initialize( name, direction, position )
          super( name,direction,position )
     end
     def move
       self.class.superclass.instance_method(:jumb).bind(self).call
     end 
     def eat(name)
       self.class.superclass.instance_method(:eat).bind(self).call(name)
     end
     
     
end

class Frog < Animals

     def initialize( name, direction, position )
          super( name,direction,position )
     end
     def move
       self.class.superclass.instance_method(:jumb).bind(self).call
     end 
     def eat(name)
       self.class.superclass.instance_method(:eat).bind(self).call(name)
     end
     
    
end

class Snake < Animals

     def initialize( name, direction, position )
          super( name,direction,position )
     end
     def move
       self.class.superclass.instance_method(:move).bind(self).call
     end 
     def eat(name)
       self.class.superclass.instance_method(:eat).bind(self).call(name)
     end
     
end

class BullFrog < Animals

     def initialize( name, direction, position )
          super( name,direction,position )
     end
     def move
       self.class.superclass.instance_method(:jumb).bind(self).call
     end 
    def eat(name)
       self.class.superclass.instance_method(:eat).bind(self).call(name)
    end
     
    
end

W1=Worm.new("Worm","N",[1,1])
S1 = Snake.new("Snake","W",[5,2])
G1 = GrassHoper.new("GrassHoper","E",[1,2])
F1 = Frog.new("Frog","S",[7,2])
B1 = BullFrog.new("BullFrog","W",[3,2])
objlist=[W1,S1,G1,F1,B1]

while objlist.length>1
	print "------------------------------------------------------","\n"		
	meetlist = []
	sleep(1)
	for obj in objlist
		obj.move
	        if meetlist.length == 0
			meetlist.push(obj.name,obj.position)
			
			
		else
			meetlist.push(obj.name,obj.position)
                        
			
		        for i in (1..meetlist.length-2)
                            if meetlist[i] == obj.position
		               
                        	name1=meetlist[i-1]
				name2=obj.name
				puts "########## #{name1}  meets  #{name2} ###########"
						
				
				if name1 == "GrassHoper" and name2 == "Worm"
							objlist.delete(W1)
							obj.eat(name2)
							break
						
				elsif name1 == "Worm" and name2 == "GrassHoper"
							objlist.delete(W1)
							obj.eat(name1)
							break
						
				elsif name1 == "Frog" and name2 == "GrassHoper"
							objlist.delete(G1)
							obj.eat(name2)
							break
						
				elsif name1 == "GrassHoper" and name2 == "Frog"
							objlist.delete(G1)
							obj.eat(name1)
							break
				elsif name1 == "Snake" and  name2 == "Frog"
							objlist.delete(F1)
							obj.eat(name2)							
							break
						
				elsif name1 == "Frog" and name2 == "Snake"
							objlist.delete(F1)
							obj.eat(name1)							
							break

				elsif name1 == "Snake" and name2 == "GrassHoper"
							objlist.delete(G1)
							obj.eat(name2)							
							break
						
				elsif name1 == "GrassHoper"  and name2 == "Snake"
							objlist.delete(G1)
							obj.eat(name1)							
							break

				elsif name1 == "BullFrog" and name2 == "Frog"
							objlist.delete(F1)
							obj.eat(name2)							
							break

				elsif name1 == "Frog" and name2 == "BullFrog"
							objlist.delete(F1)
							obj.eat(name1)							
							break

				elsif name1 == "BullFrog" and name2 == "Snake"
							objlist.delete(S1)
							obj.eat(name2)
							break
						
				elsif name1 == "Snake" and name2 == "BullFrog"
							objlist.delete(S1)
							obj.eat(name1)
							break
   
			        end
                          end                        
			
                        end
                        
                end
        end
end
