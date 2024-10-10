import heapq

def solution(n, k, enemy):
    stage = len(enemy)
    if k >= stage:
        return stage
    q = []
    for i in range(stage):
        heapq.heappush(q, enemy[i])
        if len(q) > k:
            popped = heapq.heappop(q)
            
            if popped > n:
                return i
            n -= popped
    return stage
        
        
        
    return answer