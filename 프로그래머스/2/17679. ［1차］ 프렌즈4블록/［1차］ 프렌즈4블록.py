dr = [1, 1, 0]
dc = [0, 1, 1]

def solution(m, n, board): # M -> row, N -> column 
    boards = []
    answer = 0
    row = m
    column = n
    
    for b in board:
        boards.append(list(b))
        
    while True:
        delete_list = set()
        for r in range(row):
            for c in range(column):
                now = boards[r][c]
                if now != " ":
                    temp_list = [(r, c)]
                    for i in range(3):
                        next_r = r + dr[i]
                        next_c = c + dc[i]
                        
                        if 0 <= next_c < column and 0 <= next_r < row and boards[next_r][next_c] == now:
                            temp_list.append((next_r, next_c))
                    if len(temp_list) == 4:
                        for temp in temp_list:
                            delete_list.add(temp)
        answer += len(delete_list)
        if len(delete_list) != 0:
            for d in delete_list:
                boards[d[0]][d[1]] = " "
        else:
            break
        
        for i in range(row-1, -1, -1):
            temp_row = boards[i]
            for (c, value) in enumerate(temp_row):
                if value == " ":
                    for t in range(i, -1, -1):
                        if boards[t][c] != " ":
                            boards[i][c] = boards[t][c]
                            boards[t][c] = " "
                            break
                            

    return answer