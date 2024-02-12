N = int(input())

ans = 0
row = [0] * N
def is_promising(x):
    for i in range(x):
        if row[x] == row[i] or abs(row[x] - row[i]) == abs(x - i):
            return False

    return True


def n_queens(x): # x가 depth이자 row라고 생각하면 될듯!..
    global ans
    if x == N:
        ans += 1
        return

    else:
        for i in range(N): # 하나의 row에 대해서 각각의 column을 순회해서 확인해본다.
            # [x, i]에 퀸을 놓겠다. -> row - x, column - i 로 설정 
            row[x] = i
            if is_promising(x):
                n_queens(x + 1)


n_queens(0)
print(ans)