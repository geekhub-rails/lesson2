class Game


    def start       
        p "enter name of your parrot, please: "
        @name = gets.chomp
        @parrot = Parrot.new(@name)
        ask_user
        loop do
            display_parrot
            p "please enter command number: "
          
            todo = user_input
            case todo
            when 1 then give_food
            when 2 then give_water
            when 3 then give_banana
            when 4
                p  "what word you wanna teach #{@name}"
                word = gets.chomp
                teach_new_word(word)
            when 5 then open_jail
            when 6 then return_to_jail
            when 7 then turn_lights_on
            when 8 then turn_lights_off
            when 9 then exit
            else p "i don't now the command"                     
            end 
            @parrot.life_time
        end
        
    end


    def display_parrot
        p inspect
    end

    def give_food
        p "#{@name} has eaten the food"
        @parrot.food_in_jeil = 12
        @parrot.food_in_stomach = 4
        @parrot.wants_to_fly = true
    end

    def give_water
        p "#{@name} has got the water"
        @parrot.clean_water_count = 10
    end

    def open_jail
        @in_jeil = false
        p "#{@name} has left the jail" 
        @parrot.mood = "happy"   
        @parrot.wants_to_fly = false
    end

    def return_to_jail
        @parrot.in_jeil = true
        p "#{@name} return to the jeil" 
        @parrot.mood = "good"   
     
    end

    def teach_new_word(word)
        @parrot.learned_words << word
        p "#{@name} teach word '#{word}'. it knows this words: #{@parrot.learned_words}"
        @parrot.wants_banana = true
 
    end

    def turn_lights_off
        @parrot.wants_to_sleep = true
        p "#{@name} sleep"
      
    end

    def turn_lights_on
        @parrot.wants_to_sleep = false
        p "#{@name} wake up"
        @parrot.mood = "norm"    
    
    end

    def give_banana
        p "#{@name} eats banana"
        @parrot.mood = "happy" 
        @parrot.wants_banana = false      
    end

    private 
    
    def ask_user
        p "What do you want to do? choose command  "
        p "give food >> write 1"
        p "give water >> write 2"
        p "give banana >> write 3"
        p "teach new word >> write 4"
        p "open jeil >> write 5"
        p "return to jail >> write 6"
        p "turn lights on >> write 7"
        p "turn lights off >> write 8"
        p "exit >> write 9"
    end

    def user_input
        todo = gets.chomp.to_i
    end

end