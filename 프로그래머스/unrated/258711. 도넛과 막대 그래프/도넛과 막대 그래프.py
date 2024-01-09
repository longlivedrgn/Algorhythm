def solution(edges):
    answer = [0, 0, 0, 0]
    # 각 정점마다 (나가는 간선의 갯수, 들어온 간선의 갯수)를 생성하자.
    edges_hash = {}
    for edge in edges:
        if not edges_hash.get(edge[0]):
            edges_hash[edge[0]] = [0, 0]
        if not edges_hash.get(edge[1]):
            edges_hash[edge[1]] = [0, 0]
        edges_hash[edge[0]][0] += 1
        edges_hash[edge[1]][1] += 1

    for (key, value) in edges_hash.items():
        if value[1] == 0 and value[0] >= 2: # 생성 정점 찾기
            answer[0] = key
        if value[1] >= 1 and value[0] == 0: # 막대 모양 그래프의 수
            answer[2] += 1
        if value[1] >= 2 and value[0] == 2: # 8자 모양의 그래프의 수
            answer[3] += 1
    answer[1] = edges_hash[answer[0]][0] - answer[2] - answer[3]

    return answer







    answer = []
    return answer