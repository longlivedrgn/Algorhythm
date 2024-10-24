import itertools
L, C = map(int, input().split())
alphabets = list(map(str, input().split()))
alphabets.sort()
moum = {"a", "e", "i", "o", "u"}

allList = list(itertools.combinations(alphabets, L))
for eachOne in allList:
    count = 0
    for eachThing in eachOne:
        if eachThing in moum:
            count += 1

    if count > 0 and (L-count) >= 2:
        print("".join(eachOne))
