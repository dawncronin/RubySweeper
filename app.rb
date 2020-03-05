#implementing a mini minsweeper game
# we will need a randomized board arr, and a selected spots arr
#after each turn, check for game over conditions, or winning conditions



def start 
    puts "Welcome to RubySweeper"



    board = board()
    plays = [['-', '-', '-', '-','-'], ['-', '-', '-', '-','-'], ['-', '-', '-', '-','-'], ['-', '-', '-', '-','-'], ['-', '-', '-', '-','-']]

    playGame(board, plays)
end

def board 
    spaces = [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
    # spaces.each do |r|
    #     puts r.each { |p| p }.join(" ")
    # end

    5.times do
        a = rand(0...5)
        b = rand(0...5)
        spaces[a][b] = "B"
    end


    spaces.each_with_index do |row, i|
        row.each_with_index do |space, j|
            if space == "B"
                next
            end

            if  i > 0 && j > 0 && spaces[i-1][j-1] == "B"
                spaces[i][j] += 1
            end
            if i > 0 && spaces[i-1][j] == "B"
                spaces[i][j] += 1
            end
            if  i > 0 && spaces[i-1][j+1] == "B"
                spaces[i][j] += 1
            end
            if j > 0 && spaces[i][j-1] == "B"
                spaces[i][j] += 1
            end
            if spaces[i][j+1] == "B"
                spaces[i][j] += 1
            end
            if i < 4 && j > 0 && spaces[i+1][j-1] == "B"
                spaces[i][j] += 1
            end
            if i < 4 && spaces[i+1][j] =="B"
                spaces[i][j] += 1

            end
            if  i < 4 && spaces[i+1][j+1] == "B"
                spaces[i][j] += 1
            end

        end

    end

    return spaces

    # spaces.each do |r|
    #     puts r.each { |p| p }.join(" ")
    # end
end

def playGame(board, plays)
    puts "please enter the row followed by the column number"
  
    flag = true
    until flag == false 
        #check game condiditions

        plays.each do |r|
            puts r.each { |p| p }.join(" ")
        end
        puts "row:"
        row = gets.chomp.to_i - 1
        puts "column:"
        column = gets.chomp.to_i - 1

        plays[row][column] = board[row][column]
        if board[row][column] == "B"
            flag = false
            puts "game over!"
            plays.each do |r|
                puts r.each { |p| p }.join(" ")
            end
        end
        

    end


end

start()