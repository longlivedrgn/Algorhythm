from collections import deque

N, d, k , c = map(int, input().split())
answer = 0
sushis = []
for _ in range(0,N):
    sushis.append(int(input()))
sushis += sushis

sushis_q = deque(sushis[0:k])
length = len(set(sushis_q))
if answer < length:
    answer = length

for i in range(k,len(sushis)):
    sushis_q.popleft()
    sushis_q.append(sushis[i])
    temp_set = set(sushis_q)
    temp_set.add(c)
    length = len(temp_set)
    if answer < length:
        answer = length
    if answer == k+1:
        break
print(answer)

