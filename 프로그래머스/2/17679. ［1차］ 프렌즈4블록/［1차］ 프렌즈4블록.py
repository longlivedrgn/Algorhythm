dr = [1, 1, 0]
dc = [0, 1, 1]

def solution(m, n, board): # M -> row, N -> column 
    answer = 0
    rboard = [list(i) for i in board]
    # "0"으로 바꾸기
    while True:
        delete_list = []
        temp_answer = 0
        for r in range(m):
            for c in range(n):
                if rboard[r][c] != "0":
                    temp_list = [[r, c]]
                    for i in range(3):
                        nr = r+dr[i]
                        nc = c + dc[i]

                        if 0 <= nr < m and 0 <= nc < n:
                            if rboard[nr][nc] == rboard[r][c]:
                                temp_list.append([nr, nc])
                    if len(temp_list) == 4:
                        delete_list.append(temp_list)
        for delete in delete_list:
            for d in delete:
                if rboard[d[0]][d[1]] != "0":
                    temp_answer += 1
                    rboard[d[0]][d[1]] = "0"
        answer += temp_answer
        if temp_answer == 0:
            break
        
        # 아래로 내리기
        for r in range(m-1, -1, -1):
            row_list = rboard[r]
            for (c, value) in enumerate(row_list):
                if value == "0":
                    for i in range(r, -1, -1):
                        for v in range(i, -1, -1):
                            if rboard[v][c] != "0" and rboard[r][c] == "0":
                                rboard[r][c] = rboard[v][c]
                                rboard[v][c] = "0"
            
    return answer