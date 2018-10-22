class Parrot
    def initialize(name)
        @name = name
        @lives = 3
        @mood = "good"
        @food_in_stomach = 4
        @food_in_jeil = 10
        @clean_water_count = 5
        @in_jeil = true
        @wants_to_sleep = false
        @wants_to_fly = true
        @wants_banana = false
        @learned_words = []
        p  'Parrot ' + @name + ' was born.'
    end

    def display_parrot
        p inspect
    end

    def give_food
        p "#{@name} has eaten the food"
        @food_in_jeil = 10
        life_time
        @wants_to_fly = true
    end

    def give_water
        p "#{name} has got the water"
        @clean_water_count = 5
        life_time
    end

    def open_jail
        @in_jeil = false
        p "#{name} has left the jail" 
        @mood = "happy"      
        life_time
        @wants_to_fly = false
    end

    def return_to_jail
        @in_jeil = true
        p "#{name} return to the jeil" 
        @mood = "good"   
        life_time
    end

    def teach_new_word(word)
        @learned_words << word
        @wants_banana = true
        life_time
    end

    def turn_lights_off
        @wants_to_sleep = true
        p "#{name} sleep"
        life_time
    end

    def turn_lights_on
        @wants_to_sleep = false
        p "#{name} wake up"
        @mood = "norm"    
        life_time
    end

    private

    def hungry? 
        @food_in_stomach <= 1      
    end

    def has_food?
        @food_in_jeil >= 2
    end
    
    def has_water?
        @clean_water_count >= 2
    end

    def poops
        @food_in_stomach -= 4 if @food_in_stomach >=4
    end

    def life_time
        poops
        if hungry?
            if has_food?
                @food_in_jeil -= 4
                @food_in_stomach += 4
            else
                "#{name} screams loudly!"
            end
        end
        if has_water?
            @clean_water_count -= 2
        else 
            "#{name} screams loudly!"
        end             
    end

    def is_talking?
        if @learned_words.empty?
            p "#{name} says 'krya-krya'"
        else
            @learned_words[rand(@learned_words.size)] 
        end            
    end
    
    

end