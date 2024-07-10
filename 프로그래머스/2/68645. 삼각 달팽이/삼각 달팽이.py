# 맨 처음에는 down -> right -> 대각선 up -> down -> right -> 대각선 up ... 이게 계속 반복이된다.
def solution(n):
    answer = []
    board = [[0] * n for i in range(n)] # 일단 꽉 채운 사각형 만들기!..
    r, c = -1, 0
    number = 1
    
    for i in range(n):
        for j in range(i, n):
            if i % 3 == 0: # down
                r += 1
            elif i % 3 == 1: # right
                c += 1
            else: # 대각선 up
                r -= 1
                c -= 1
            
            board[r][c] = number
            number +=1
    
    for m in range(n):
        for v in range(n):
            if board[m][v] != 0:
                answer.append(board[m][v])
    return answer