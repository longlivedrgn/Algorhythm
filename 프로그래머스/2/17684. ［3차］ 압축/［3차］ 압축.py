
def solution(msg):
    answer = []
    # 사전 초기화 A~Z
    dic = {chr(i + 64): i for i in range(1, 27)}

    current = next = 0  # 인덱스 초기화 w-> 현재, c -> 다음 글자의 인덱스
    while True:
        next += 1
        if next == len(msg):
            answer.append((dic[msg[current:next]]))
            break

        # 만약 [현재글자+다음글자]가 사전에 없다면
        if msg[current:next + 1] not in dic:
            dic[msg[current:next + 1]] = len(dic) + 1  # 사전에 추가
            answer.append(dic[msg[current:next]])
            current = next  # 현재글자를 다음글자로 옮겨줌

        # 만약 [현재글자+다음글자]가 사전에 있다면 w의 값은 변하지 않고 c의 값만 1씩 증가한다.
    return answer