class Parrot
    attr_accessor :clean_water_count, :food_in_stomach, :food_in_jeil, 
        :wants_to_sleep, :wants_banana, :learned_words, :wants_to_fly,
        :in_jeil, :mood

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

    
    private

    def hungry? 
        @food_in_stomach <= 2      
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