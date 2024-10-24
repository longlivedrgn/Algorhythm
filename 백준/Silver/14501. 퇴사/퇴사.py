days = int(input())
dayList = []
for _ in range(days):
    dayList.append(list(map(int,input().split())))

answer = 0

def DFS(start, tempSum):
    global answer


    if start > days:
        return
    answer = max(answer, tempSum)

    for i in range(start, days):
        DFS(i+dayList[i][0], tempSum+dayList[i][1])

DFS(0, 0)
print(answer)
