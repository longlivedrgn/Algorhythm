import heapq

def solution(n, works):
    answer = 0
    
    # 기본적으로 heapq는 min heap이다.
    # 따라서 pop을 하면 최소 원소가 나오게 된다.
    # 따라서 우리는 최댓 값이 필요하므로 max heap을 만들어줘야된다.
    works = [-work for work in works] # 다 -를 붙혀줘서 max heap을 만들어준다.
    heapq.heapify(works)
    
    for _ in range(n):
        i = heapq.heappop(works) # 제일 높은 놈 뽑기
        if i != 0:
            i += 1 # +1 하기!
        heapq.heappush(works, i) # 다시 집어넣기
    
    for work in works: # 그래도 works를 순회돌리면 된다.
        answer += work ** 2
    return answer