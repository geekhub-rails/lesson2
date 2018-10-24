class Game


    def start       
        puts "enter name of your parrot, please: ".light_green
        @name = gets.chomp
        @parrot = Parrot.new(@name)
        
        loop do
            display_parrot
            todo = ask_user        
            case todo
            when 1 then give_food
            when 2 then give_water
            when 3 then give_banana
            when 4
                puts  "what word you wanna teach #{@name}".light_green
                word = gets.chomp
                teach_new_word(word)
            when 5 then open_jail
            when 6 then return_to_jail
            when 7 then turn_lights_on
            when 8 then turn_lights_off
            when 9 then exit
            else puts "i don't now the command".light_red                     
            end 
            @parrot.life_time
        end
        
    end


    def display_parrot
        @parrot.how_are_u
    end

    def give_food
        puts "#{@name} has eaten the food".light_green
        @parrot.food_in_jeil = 12
        @parrot.food_in_stomach = 4
        @parrot.wants_to_fly = true
    end

    def give_water
        puts "#{@name} has got the water".light_green
        @parrot.clean_water_count = 10
    end

    def open_jail
        @in_jeil = false
        puts "#{@name} has left the jail".light_green
        @parrot.mood = "happy"   
        @parrot.wants_to_fly = false
    end

    def return_to_jail
        @parrot.in_jeil = true
        puts "#{@name} return to the jeil".light_green
        @parrot.mood = "good"   
     
    end

    def teach_new_word(word)
        @parrot.learned_words << word
        puts "#{@name} teach word '#{word}'. it knows this words: #{@parrot.learned_words}".light_green
        @parrot.wants_banana = true
 
    end

    def turn_lights_off
        @parrot.wants_to_sleeputs = true
        puts "#{@name} sleep".light_green
      
    end

    def turn_lights_on
        @parrot.wants_to_sleeputs = false
        puts "#{@name} wake up".light_green
        @parrot.mood = "norm"    
    
    end

    def give_banana
        puts "#{@name} eats banana".light_green
        @parrot.mood = "happy" 
        @parrot.wants_banana = false      
    end

    private 
    
    def ask_user
        puts "\n\n\n"
        puts "What do you want to do? choose command  ".light_green
        puts "give food >> write 1".light_green
        puts "give water >> write 2".light_green
        puts "give banana >> write 3".light_green
        puts "teach new word >> write 4".light_green
        puts "open jeil >> write 5".light_green
        puts "return to jail >> write 6".light_green
        puts "turn lights on >> write 7".light_green
        puts "turn lights off >> write 8".light_green
        puts "exit >> write 9".red
        todo = gets.chomp.to_i
    end

   

end