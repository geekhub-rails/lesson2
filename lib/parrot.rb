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
        @clean_water_count = 6
        @in_jeil = true
        @wants_to_sleep = false
        @wants_to_fly = true
        @wants_banana = false
        @learned_words = []
        p  'Parrot ' + @name + ' was born.'
    end 


    def life_time
        if dead?
            p "#{@name} is dead. his had no food neither water and no lifes"
            exit
        end
        if hungry?
            if has_food?
                @food_in_jeil -= 4
                @food_in_stomach +=4
            else
                loose_one_life
                p "#{@name} screams loudly!"
            end
        end
        if has_water?
            @clean_water_count -= 2
        else 
            p "#{@name} screams loudly!"
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
        if @food_in_stomach == 0 ||  @clean_water_count == 0
             @lifes -=1
             p "#{@name} screaming loadly"
             p "you forgot give you parrot water or food, so it loose one life." 
             p "the number of lifes = #{@lifes}"
        end
     end
 
     def dead?
        @lifes == 0
     end
 

 
    def is_talking?
        if @learned_words.empty?
            p "#{name} says 'krya-krya'"
        else
            @learned_words[rand(@learned_words.size)] 
        end            
    end
    
    

end