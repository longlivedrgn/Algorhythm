from collections import deque

test_count = int(input())

def BFS():
    q = deque()
    q.append(home)

    while q:
        popped = q.popleft()

        if abs(popped[0] - stadium[0]) + abs(popped[1] - stadium[1]) <= 1000:
            print("happy")
            break

        for i in range(convenience_count):
            if visited[i] == False:
                if abs(popped[0]-conveniences[i][0]) + abs(popped[1]-conveniences[i][1]) <= 1000:
                    q.append(conveniences[i])
                    visited[i] = True
    else:
        print("sad")

for _ in range(test_count):
    convenience_count = int(input())
    home = list(map(int, input().split()))
    conveniences = []
    for i in range(convenience_count):
        temp_list = list(map(int, input().split()))
        conveniences.append(temp_list)
    stadium = list(map(int, input().split()))
    visited = [False for _ in range(convenience_count)] # 편의점 방문 체크
    BFS()


