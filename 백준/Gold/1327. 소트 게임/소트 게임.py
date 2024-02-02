from collections import deque

n, k = map(int, input().split())
numbers = list(input().split()) # ['3', '2', '1'] 이렇게 받기!..
visited = set() # 방문 체크를 할 Set을 만들기!..
visited.add("".join(numbers)) # { '321' } # Set 안에 list를 넣을 수가 없으므로 join으로 하나의 숫자로 바꿔서 넣기!..

target = sorted(numbers) # target을 정의한다.
q = deque() 
q.append([numbers, 0]) # [ [[3, 2, 1], 0] ] 가 들어가있다.

# BFS로 모든 경우 수를 탐색해본다.
while q:
    popped = q.popleft()
    tempNumbers = popped[0] # [3, 2, 1]
    cnt = popped[1] # 0

    if tempNumbers == target:
        print(cnt)
        break

    for i in range(n-k+1): # 요만큼 돌릴 수 있다.
        # 뒤집어질 숫자 만들기
        reversing_list = tempNumbers[i:i+k]
        reversing_list.reverse() # 뒤집기!..
        # 다시 붙히기!..
        transformed_list = tempNumbers[:i] + reversing_list + tempNumbers[i+k:]

        if "".join(transformed_list) not in visited: # 리스트에 들어간 놈을 합쳐서 visitied set과 비교해본다.
            visited.add("".join(transformed_list)) # visited에 방문했다고 빵 찍기!..
            q.append([transformed_list, cnt+1])
else:
    print(-1)
