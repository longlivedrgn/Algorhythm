def solution(gems):
    answer = [0, len(gems)]  # 답을 저장할 변수
    gem_types = len(set(gems))  # 보석 종류의 개수
    gem_dict = {}
    current_types = 0  # 현재까지 발견된 보석 종류의 개수
    start, end = 0, 0  # 투 포인터

    while end < len(gems):
        # 보석 추가
        if gems[end] in gem_dict:
            gem_dict[gems[end]] += 1
        else:
            gem_dict[gems[end]] = 1
            current_types += 1  # 새로운 보석 종류 발견 시 증가

        # 모든 종류의 보석이 포함된 경우
        while current_types == gem_types:
            if end - start < answer[1] - answer[0]:
                answer = [start, end]  # 최소 구간 갱신

            # 보석 제거
            gem_dict[gems[start]] -= 1
            if gem_dict[gems[start]] == 0:  # 특정 보석의 개수가 0이 되면
                del gem_dict[gems[start]]  # 딕셔너리에서 삭제
                current_types -= 1  # 보석 종류 감소
            start += 1  # 시작 포인터 이동

        end += 1  # 끝 포인터 이동

    return [answer[0] + 1, answer[1] + 1]  # 1번 진열대 기준으로 1 증가