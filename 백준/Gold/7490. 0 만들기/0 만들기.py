def DFS(sum, sign, num, n, string):
    if (n == N): # 끝에 도달했다!..
        sum = sum + (sign * num)
        if sum == 0:
            print(string)
    else:
        DFS(sum, sign, num * 10 + (n + 1), n + 1, string + ' ' + str(n + 1)) # " " 일 경우
        DFS(sum + sign * num, 1, (n + 1), n + 1, string + '+' + str(n + 1)) # "+"일 경우
        DFS(sum + sign * num, -1, (n + 1), n + 1, string + '-' + str(n + 1)) # "-"일 경우


test_case = int(input())

for _ in range(test_case):
    N = int(input())
    DFS(0, 1, 1, 1, "1")
    print()