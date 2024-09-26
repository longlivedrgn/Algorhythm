def solution(arrayA, arrayB):
    answer = 0

    gcdA = arrayA[0]
    gcdB = arrayB[0]
    for a in arrayA[1:]:
        if gcdA >= a:
            gcdA = gcd(gcdA, a)
        else:
            gcdA = gcd(a, gcdA)
    for b in arrayB[1:]:
        if gcdB >= b:
            gcdB = gcd(gcdB, b)
        else:
            gcdB = gcd(b, gcdB)

    if isNotDivided(gcdA, arrayB):
        answer = max(answer, gcdA)
        if answer == 5:
            print("뭔데")

    if isNotDivided(gcdB, arrayA):
        answer = max(answer, gcdB)

    return answer


def gcd(a, b):
    while b > 0:
        a, b = b, a % b
    return a


def isNotDivided(ipt, arr):
    isAllNotDivided = True
    for ar in arr:
        if ar % ipt == 0:  # 나머지가 생긴다 -> False
            isAllNotDivided = False
    return isAllNotDivided