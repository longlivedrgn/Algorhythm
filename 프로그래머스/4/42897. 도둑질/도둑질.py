def solution(money):
    # firstDP -> 맨 첫 집을 포함한다.
    firstDP = [0] * len(money) # 맨 앞에 0을 하나 넣어두기!..
    # secondDP -> 맨 마지막 집을 포함하지 않는다.
    secondDP = [0] * len(money) # 맨 앞에 0을 하나 넣어두기!..

    # 첫번째 집을 도둑질하는 경우
    firstDP[0] = money[0]

    for i in range(1, len(money) -1): # 마지막은 집은 도둑질하지 못한다.
        firstDP[i] = max(firstDP[i-1], firstDP[i-2] + money[i])

    secondDP[0] = 0
    for i in range(1, len(money)):
        secondDP[i] = max(secondDP[i-1], secondDP[i-2] + money[i])

    return max(firstDP[-2], secondDP[-1])