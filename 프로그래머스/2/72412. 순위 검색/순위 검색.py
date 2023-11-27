from itertools import combinations
from bisect import bisect_left


def solution(info, query):
    answer = []
    info_dict = {}

    for i in range(len(info)):
        # 먼저 테스트 진행자 -> info이다!...
        # 먼저 면접 진행자들의 생길 수 있는 모든 조합을 만들어서 Dictionary로 만든다.
        infol = info[i].split()  # info안의 문자열을 공백을 기준으로 분리
        mykey = infol[:-1]  # info의 점수제외부분을 key로 분류 -> ["java", "backend", "junior", "pizza"]
        myval = infol[-1]  # info의 점수부분을 value로 분류 -> ["150"]

        for j in range(5):  # key들로 만들 수 있는 모든 조합 생성
            for c in combinations(mykey, j):
                tmp = ''.join(c) # 일단 다 합치기!..
                if tmp in info_dict:
                    # 만약
                    info_dict[tmp].append(int(myval))  # 그 조합의 key값에 점수 추가
                else:
                    info_dict[tmp] = [int(myval)]
    # 일단, 지원자들의 모든 조합들과 점수들을 dictionary 형태로 만들어주기

    # 그리고 나중에 이진탐색할거니까 value값들을 sorting 해준다.
    for k in info_dict:
        info_dict[k].sort()  # dict안의 조합들을 점수순으로 정렬 -> 점수를 오른차순으로 변경하기!...

    for qu in query:  # query도 마찬가지로 key와 value로 분리
        myqu = qu.split(' ') # 먼저 빈칸을 기준으로 나누기!...
        qu_key = myqu[:-1] # 점수 전까지를 slicing하기!..
        qu_val = myqu[-1] # 점수를 가져오기!..

        while 'and' in qu_key:  # and 제거
            qu_key.remove('and')
        while '-' in qu_key:  # - 제거
            qu_key.remove('-')
        qu_key = ''.join(qu_key)  # dict의 key처럼 문자열로 변경 -> javabackendjuniorpizza 이런 식으로 변경하기!..

        if qu_key in info_dict:  # query의 key가 info_dict의 key로 존재하면
            scores = info_dict[qu_key] # score를 가져온다.

            # if scores:  # score리스트에 값이 존재하면
            enter = bisect_left(scores, int(qu_val)) # scores 배열에서 해당 값이 몇번째 위치에 있는 지 알아낸다.
            answer.append(len(scores) - enter) # 이러면 몇명이 qu_val 보다 높은 지를 알 수가 있다.
        else:
            answer.append(0)

    return answer