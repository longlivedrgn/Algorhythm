def solution(rows, columns, queries):
    answer = []
    board = [[columns*i + j for j in range(1, columns+1)] for i in range(rows)]

    for r1, c1, r2, c2 in queries:  # 2, 2, 5, 4
        min_value = 1000000000
        # 왼쪽 -> 아래 -> 오른쪽 -> 상단 방향으로 회전하기
        temp_left_top = board[r1 - 1][c1 - 1]
        min_value = min(temp_left_top, min_value)

        # 왼쪽
        for i in range(r1+1, r2+1): # (3, 6) -> 3,4, 5
            board[i-2][c1-1] = board[i-1][c1-1]
            min_value = min(min_value, board[i-1][c1-1])

        # 아래
        for i in range(c1+1, c2+1): # (3, 5) -> 3, 4
            board[r2-1][i-2] = board[r2-1][i-1]
            min_value = min( board[r2-1][i-1], min_value)

        # 오른쪽
        for i in range(r2-1, r1-1, -1): #(4, 1, -1) -> 4, 3, 2
            board[i][c2-1] = board[i-1][c2-1]
            min_value = min(min_value, board[i-1][c2-1])

        # 상단
        for i in range(c2-1, c1, -1): #(3, 2,-1_) # 3
            board[r1-1][i] = board[r1-1][i-1]
            min_value = min(min_value, board[r1-1][i-1])

        board[r1 - 1][c1] = temp_left_top

        answer.append(min_value)

    return answer