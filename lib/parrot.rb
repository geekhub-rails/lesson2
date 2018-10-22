class Parrot
    def initialize(name)
        @name = name
        @lives = 3
        @mood = "good"
        @foodInStomach = 4
        @foodInJeil = 10
        @cleanWaterCount = 5
        @inJeil = true
        @WantsTosleep = false
        @whantsToFly = true
        @wantsBanana = false
        @learnedWords = []
        p @name + ' was born.'
    end

    def displayParrot
        p inspect
    end

    def giveFeed
        p '#{@name} has eaten the food'
        @foodInJeil = 10
        lifeTime
        @whantsToFly = true
    end

    def giveWater
        p '#{name} has got the water'
        @cleanWaterCount = 5
        lifeTime
    end

    def openJail
        @inJeil = false
        p '#{name} has left the jail'  
        @mood = "happy"      
        lifeTime
        @whantsToFly = false
    end

    def returnToJail
        @inJeil = true
        p '#{name} return to the jeil'  
        @mood = "good"   
        lifeTime
    end

    def teachNewWord(word)
        @learnedWords << word
        @wantsBanana = true
        lifeTime
    end

    def turnLightsOff
        @WantsToSleep = true
        p '#{name} sleep'
        lifeTime
    end

    def turnLightsOn
        @WantsToSleep = false
        p '#{name} wake up'
        @mood = "norm"    
        lifeTime
    end

    private

    def hungry? 
        @foodInStomach <= 1      
    end

    def hasFood?
        @foodInJeil >= 2
    end
    
    def hasWater?
        @cleanWaterCount >= 2
    end

    def poops
        @foodInStomach -= 4 if @foodInStomach >=4
    end

    def lifeTime
        poops
        if hungry?
            if hasFood?
                @foodInJeil -= 4
                @foodInStomach += 4
            else
                '#{name} screams loudly!'
            end
        end
        if hasWater?
            cleanWaterCount -= 2
        else 
            '#{name} screams loudly!'
        end             
    end

    def isTalking
        if @learnedWords.empty?
            p "#{name} says 'krya-krya'"
        else
            @learnedWords[rand(@learnedWords.size)] 
        end            
    end
    
    

end