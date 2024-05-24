def solution(tickets):
    visited = [False for i in range(len(tickets))]
    answers = []

    def DFS(start, path): # 2, [ICN, JFK, "HND"]
        if len(path) == len(tickets)+1:
            answers.append(path)
            return
        for (idx, ticket) in enumerate(tickets):
            if visited[idx] == False and ticket[0] == tickets[start][1]:
                visited[idx] = True
                DFS(idx, path + [ticket[1]])
                visited[idx] = False

    for (idx,ticket) in enumerate(tickets):
        if ticket[0] == "ICN":
            visited[idx] = True
            DFS(idx, ticket) # [ICN, JFK]
            visited[idx] = False
    answers.sort()
    
    return answers[0]