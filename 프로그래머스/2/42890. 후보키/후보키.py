from itertools import combinations

def solution(relation):
    row = len(relation)
    column = len(relation[0])

    # 전체 조합 구하기
    candidates = []
    for i in range(1, column +1):
        candidates += list(combinations(range(column), i))

    # 유일성 만족하는 얘들 챙기기
    unique = []
    for cd in candidates:
        tmp = []
        for item in relation:
            sm_tmp = []
            for i in cd:
                sm_tmp.append(item[i])
            tmp.append(tuple(sm_tmp))
        if len(set(tmp)) == row:
            unique.append(cd)

    # 최소성 만족하지 못하는 놈들 제거하기 -> 두 개씩 비교해서
    answer = set(unique)
    for first in range(len(unique)):
        for second in range(first+1, len(unique)):
            if len(unique[first]) == len(set(unique[first]) & set(unique[second])): # 교집합 구하기
                answer.discard(unique[second])

    return len(answer)