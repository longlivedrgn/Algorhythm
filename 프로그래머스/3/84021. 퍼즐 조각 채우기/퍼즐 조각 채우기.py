from collections import deque

dx = [0, 0, -1, 1]
dy = [-1, 1, 0, 0]

# board와 puzzle의 각각 빈공간과 블럭을 찾는 함수 (BFS)
def find_block(board, f):
    # empty_blocks = find_block(game_board, 0)
    # BFS를 돌려서 빈 공간이나, block 찾기
    empty_board_list = [] # game_board의 경우에는 0인 곳을, table의 경우에는 1을 여기에가다 담는다.
    # visited = [[False] * len(board) for _ in range(len(board))]

    for i in range(len(board)):
        for j in range(len(board)):
            if board[i][j] == f: # 방문하지 않았고, 내가 원하는 값이라면?
                queue = deque([(i, j)])
                board[i][j] = f ^ 1 # 1이면 0으로 0이면 1로 변경하기
                lst = [(i, j)]

                while queue:
                    x, y = queue.popleft()
                    for m in range(4):
                        nx, ny = x + dx[m], y + dy[m]
                        if nx < 0 or nx > len(board) - 1 or ny < 0 or ny > len(board) - 1:
                            continue
                        elif board[nx][ny] == f: # 내가 가야되는 곳이라면?..
                            queue.append((nx, ny))
                            board[nx][ny] = f ^ 1 # 갔다가 찍어버리기!.. 갔던 곳이라고 딱 때려버리기!...
                            lst.append((nx, ny))
                empty_board_list.append(lst)

    return empty_board_list

# 그러면 empty_blocks = find_block(game_board, 0)을 하면 아래와 같이 나오게 된다.
# [[(0, 2), (0, 3), (1, 3), (2, 3), (2, 4)], [(0, 5), (1, 5)], [(1, 0), (1, 1), (2, 0)], [(3, 2), (4, 2), (4, 1), (4, 3)], [(4, 5), (5, 5), (5, 4)], [(5, 0)]]

# block의 인덱스들로 table을 만드는 함수
def make_table(block):
    x, y = zip(*block)
    r, c = max(x) - min(x) + 1, max(y) - min(y) + 1 #  Row의 크기 계산하기, Column의 크기
    table = [[0] * c for _ in range(r)]

    for i, j in block:
        i, j = i - min(x), j - min(y)
        table[i][j] = 1
    return table


# 오른쪽으로 90도 회전하는 함수
def rotate(puzzle):
    rotate = [[0] * len(puzzle) for _ in range(len(puzzle[0]))]
    count = 0 # 1의 갯수를 count하기 위한 변수이다.
    for i in range(len(puzzle)):
        for j in range(len(puzzle[0])):
            if puzzle[i][j] == 1:
                count += 1
            rotate[j][len(puzzle) - 1 - i] = puzzle[i][j] # rotate된 column 좌표는 이전의 row좌표로 바뀐다!.. 바뀐 Row 좌표는 이전 사각형의 높이에서 -1 뺀 값에서 현재 Colunn 값을 빼면 된다.
    return rotate, count


def solution(game_board, table):
    answer = 0
    empty_blocks = find_block(game_board, 0)
    puzzles = find_block(table, 1)

    for empty in empty_blocks: # 빈 공간 하나 가져오기
        filled = False
        table = make_table(empty) # 빈 공간을 담는 직사각형 하나 만들기

        for puzzle_origin in puzzles: # 퍼즐 하나 들고오기
            if filled == True:
                break

            puzzle = make_table(puzzle_origin) # 퍼즐로도 하나의 직사각형 만들기
            for i in range(4):
                puzzle, count = rotate(puzzle)

                if table == puzzle: # 그냥 배열 자체가 같은 지를 판단할 수 있다!..bb
                    answer += count
                    puzzles.remove(puzzle_origin)
                    filled = True # 요건 밖의 Puzzle for문을 나오기 위해서 만든 장치이다.
                    break

    return answer