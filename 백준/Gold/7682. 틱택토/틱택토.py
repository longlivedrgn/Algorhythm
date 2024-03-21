dr = [0, 0, -1, 1]
dc = [-1, 1, 0, 0]

def is_tik(temp_board):
    is_o = False
    is_x = False

    # 가로 확인
    for i in range(3):
        # 가로 확인
        if temp_board[i][0] == "X" and temp_board[i][1] == "X" and temp_board[i][2] == "X":
            is_x = True
        if temp_board[i][0] == "O" and temp_board[i][1] == "O" and temp_board[i][2] == "O":
            is_o = True

        # 세로 확인
        if temp_board[0][i] == "X" and temp_board[1][i] == "X" and temp_board[2][i] == "X":
            is_x = True
        if temp_board[0][i] == "O" and temp_board[1][i] == "O" and temp_board[2][i] == "O":
            is_o = True

        # 대각선 확인
        if temp_board[0][0] == "X" and temp_board[1][1] == "X" and temp_board[2][2] == "X":
            is_x = True

        if temp_board[0][0] == "O" and temp_board[1][1] == "O" and temp_board[2][2] == "O":
            is_o = True

        if temp_board[2][0] == "X" and temp_board[1][1] == "X" and temp_board[0][2] == "X":
            is_x = True

        if temp_board[2][0] == "O" and temp_board[1][1] == "O" and temp_board[0][2] == "O":
            is_o = True

    return (is_o, is_x)

while True:
    ipt = input()
    if ipt == "end":
        exit()
    board = []
    board.append(list(map(str, ipt[0:3])))
    board.append(list(map(str, ipt[3:6])))
    board.append(list(map(str, ipt[6:9])))

    count_x = 0
    count_o = 0

    for i in range(3):
        for j in range(3):
            if board[i][j] == "X":
                count_x += 1
            if board[i][j] == "O":
                count_o += 1
    (is_o, is_x) = is_tik(board)
    if is_o == True and is_x == True:
        print("invalid")
    elif is_o == True and is_x == False:
        if count_x == count_o:
            print("valid")
        else:
            print("invalid")
    elif is_o == False and is_x == True:
        if count_x == count_o+1:
            print("valid")
        else:
            print("invalid")
    else:
        if count_x == 5 and count_o == 4:
            print("valid")
        else:
            print("invalid")




