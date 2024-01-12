computer_numbers = int(input())
network_numbers = int(input())

network_list = [[] for _ in range(computer_numbers+1)]
visited = [False for _ in range(computer_numbers+1)]
for _ in range(network_numbers):
    inputs = list(map(int, input().split()))
    network_list[inputs[0]].append(inputs[1])
    network_list[inputs[1]].append(inputs[0])
answer = 0
visited[1] = True

def DFS(start):
    global answer
    for node in network_list[start]:
        if visited[node] == False:
            visited[node] = True
            answer +=1
            DFS(node)

DFS(1)
print(answer)

