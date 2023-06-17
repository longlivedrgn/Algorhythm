import sys
from collections import  deque

input = sys.stdin.readline
deq = deque()

for _ in range(int(input())):
    lst = list(input().split())
    m = lst[0]
    if m == "push_front":
        deq.appendleft(lst[1])
    elif m == "push_back":
        deq.append(lst[1])
    elif m == "pop_front":
        if len(deq) == 0:
            print(-1)
        else:
            print(deq.popleft())
    elif m == "pop_back":
        if len(deq) == 0:
            print(-1)
        else:
            print(deq.pop())
    elif m == "size":
        print(len(deq))
    elif m == "empty":
        if len(deq) == 0:
            print(1)
        else:
            print(0)
    elif m == "front":
        if len(deq) == 0:
            print(-1)
        else:
            print(deq[0])
    elif m == "back":
        if len(deq) == 0:
            print(-1)
        else:
            print(deq[-1])