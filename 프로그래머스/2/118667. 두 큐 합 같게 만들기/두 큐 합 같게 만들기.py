from collections import deque

def solution(queue1, queue2):
    q1 = deque(queue1)
    q2 = deque(queue2)
    sum1 = sum(queue1)
    sum2 = sum(queue2)
    number = 0

    while sum1 != sum2:
        if sum1 > sum2:
            popped = q1.popleft()
            q2.append(popped)
            sum1 -= popped
            sum2 += popped
            number +=1
        else:
            popped = q2.popleft()
            q1.append(popped)
            sum1 += popped
            sum2 -= popped
            number += 1

        if number == (len(queue1) * 3):
            number = -1
            break
    return number