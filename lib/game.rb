class Game
    def start
        p "enter name of your parrot, please: "
        name = gets.chomp
        parrot = Parrot.new(name)
        loop do
            parrot.displayParrot
            sleep 5
        end
    end
end