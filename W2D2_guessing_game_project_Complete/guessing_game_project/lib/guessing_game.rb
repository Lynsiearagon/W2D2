class GuessingGame

    attr_reader :num_attempts

    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1

        if @secret_num == num
            @game_over = true 
            p 'you win'
        elsif 
            @secret_num < num 
            p 'too big'
        else
            num < @secret_num
            p 'too small'
        end
    end 

    def ask_user
        p 'Enter a number: '
        num = gets.chomp.to_i
        self.check_num(num)
    end

end
