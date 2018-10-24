class Parrot
    attr_accessor :clean_water_count, :food_in_stomach, :food_in_jeil, 
        :wants_to_sleep, :wants_banana, :learned_words, :wants_to_fly,
        :in_jeil, :mood

    def initialize(name)
        @name = name
        @lifes = 3
        @mood = "good"
        @food_in_stomach = 4
        @food_in_jeil = 12
        @clean_water_count = 10
        @in_jeil = true
        @wants_to_sleeputs= false
        @wants_to_fly = true
        @wants_banana = false
        @learned_words = []
        puts "\n\n\n"
        puts "Parrot  #{@name} was born.".light_yellow

        x = <<~parrot
        __,---.
       /__|o\  )
        `-\ / /
          ,) (,
         //   \\
        {(     )}
  =======""===""===============
          |||||
           |||
            |

        parrot
        puts x.light_cyan
    end 

    def how_are_u
        print "Hi, my name is #{@name}. ".colorize(:light_cyan)
        print "My mood is #{mood}. ".colorize(:light_cyan)
        if has_food?
            print "I have enough food. ".colorize(:light_cyan)
        else
            print "I have no food! ".colorize(:red)
            print "I am hungry! ".colorize(:red) if hungry?
        end
        if has_water?
            print "I have enough water. ".colorize(:light_cyan)
        else
            print "I have no water! ".colorize(:red)
        end
        print "I want banana! ".colorize(:light_yellow) if wants_banana
        print "I want to fly! ".colorize(:light_yellow) if wants_to_fly
        print "I  sleep now! ".colorize(:light_yellow) if wants_to_sleep
        print "\n"
        talk     
    end

    def check_death
        if dead?
            y = <<~parrot
            __,---.
           /__|x\  )
             `-\ / /
               ,) (,
              //   \\
             {(     )}
       =======""===""===============
               |||||
                |||
                 |
            parrot
            puts y.light_red
            puts "#{@name} is dead. his had no food neither water and no lifes".red
            exit
        end
    end

    def life_time    
        if hungry?
            if has_food?
                @food_in_jeil -= 4
                @food_in_stomach +=4
            else
                loose_one_life
                life_lost = true
                puts "#{@name} screams loudly!".red
            end
        end
        if has_water?
            @clean_water_count -= 2            
        else 
            puts "#{@name} screams loudly!".red
            loose_one_life if ! life_lost
        end  
        poops           
    end



    private

    def hungry? 
        @food_in_stomach <= 4      
    end

    def has_food?
        @food_in_jeil > 0
    end
    
    def has_water?
        @clean_water_count >= 2
    end

    def poops
        @food_in_stomach -= 4 if @food_in_stomach >=4
        
    end

    def loose_one_life
        if @food_in_stomach <= 0 ||  @clean_water_count <= 0
             @lifes -=1
             puts "#{@name} screaming loadly".red
             puts "you forgot give you parrot water or food, so it lost one life.".red
             puts "the number of lifes = #{@lifes}".red
        end
     end
 
     def dead?
        @lifes == 0
     end
 
    def talk
        k = rand(6)
        puts "#{@name} says: ".light_green
        if @learned_words.empty?
            k.times{puts 'krya-krya'.light_yellow}
        else
            k.times{puts @learned_words[rand(@learned_words.size)].light_yellow }
        end            
    end
end
