import heapq

heap = []
n = int(input())

for _ in range(n):
    numbers = map(int, input().split())
    for number in numbers:
        heapq.heappush(heap, number)

        if len(heap) > n: # heap의 크기를 n개로 유지
            heapq.heappop(heap)  # 제일 작은 것을 뺀다.
print(heap[0])