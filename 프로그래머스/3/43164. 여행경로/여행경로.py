def solution(tickets):
    answer = []
    visited = [False]*len(tickets)

    def DFS(airport, path):
        if len(path) == len(tickets)+1: # 만약 Ticket을 전체 다 사용했다면?..
            answer.append(path) # 마지막 Path를 append하고 끝낸다!..
            return
        for idx, ticket in enumerate(tickets):
            if airport == ticket[0] and visited[idx] == False:
                visited[idx] = True
                DFS(ticket[1], path+[ticket[1]])
                visited[idx] = False

    DFS("ICN", ["ICN"])
    answer.sort() # 일단 되는 모든 얘들을 answer에 append하므로, 거기서 sorting을 해서 결정한다.
    return answer[0]