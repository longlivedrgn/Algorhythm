from collections import Counter

def solution(topping):
    answer = 0
    chul = set()
    bro = Counter(topping)

    for i in topping:

        chul.add(i)
        bro[i] -= 1
        if bro[i] == 0: # 만약 0이되면 아예 빼버린다.
            bro.pop(i)

        if len(chul) == len(bro):
            answer += 1

    return answer