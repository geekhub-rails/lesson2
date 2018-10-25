require "colorize"
class Ball
    def shake
        @positive = ["It is certain (Бесспорно)",
         "It is decidedly so (Предрешено)", 
         "Without a doubt (Никаких сомнений)",
         "Yes — definitely (Определённо да)",
         "You may rely on it (Можешь быть уверен в этом)"]

        @hz = ["As I see it, yes (Мне кажется — «да»)",
             "Most likely (Вероятнее всего)",
             "Outlook good (Хорошие перспективы)",
             "Signs point to yes (Знаки говорят — «да»)",
             "Yes (Да)"]
        @neitral = [ "Reply hazy, try again (Пока не ясно, попробуй снова)",
             "Ask again later (Спроси позже)",
             "Better not tell you now (Лучше не рассказывать)",
             "Cannot predict now (Сейчас нельзя предсказать)",
             "Concentrate and ask again (Сконцентрируйся и спроси опять)"]
        @negative = ["Don’t count on it (Даже не думай)",
             "My reply is no (Мой ответ — «нет»)",
            "My sources say no (По моим данным — «нет»)",
             "Outlook not so good (Перспективы не очень хорошие)",
             "Very doubtful (Весьма сомнительно)"]
        all_ansvers = [@positive, @hz, @neitral, @negative]

        random_emotion = all_ansvers[rand(all_ansvers.size)]
        ansver = random_emotion[rand(random_emotion.size)]
        puts "\n\n"
        give_color(random_emotion, ansver)
        puts "\n\n"

    end
    def give_color(str, ansv)
        if str  == @positive
            puts ansv.light_blue
        elsif str == @hz
            puts ansv.light_green    
        elsif str == @neitral
            puts ansv.light_yellow
        else
            puts ansv.light_red
        end
    end

end
ball = Ball.new
ball.shake