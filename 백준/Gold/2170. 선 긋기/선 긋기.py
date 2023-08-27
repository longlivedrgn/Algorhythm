import sys

N = int(sys.stdin.readline())
list = []
for i in range(N):
    list.append(tuple(map(int, input().split())))
list.sort()
start = list[0][0]
end = list[0][1]
answer = 0

for i in range(1, N):
    # 그 다음 것이 사이라면?
    if list[i][0] <= end < list[i][1]:
        end = list[i][1]

    elif list[i][0] > end:
        answer += end - start
        start = list[i][0]
        end = list[i][1]

answer += end - start

print(answer)