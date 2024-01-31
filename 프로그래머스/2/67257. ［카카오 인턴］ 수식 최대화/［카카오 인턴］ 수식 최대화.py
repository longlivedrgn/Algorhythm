import copy
from itertools import permutations
import re

def operate(a, b, op):
    if op == "-":
        return a - b
    if op == "+":
        return a + b
    if op == "*":
        return a * b

def solution(expression):
    answer = 0
    expression = re.split("([^0-9])", expression)
    operators = ["-", "+", "*"]

    # 현재 expression에 없는 operator는 제거하기
    if "-" not in expression:
        operators.remove("-")
    if "+" not in expression:
        operators.remove("+")
    if "*" not in expression:
        operators.remove("*")

    # 현재 있는 operators를 통해서 순열 구하기!...
    operatorList = list(permutations(operators, len(operators)))

    for operator in operatorList: # 각각의 우선순위에 따라서 계산을 해본다.
        exps = copy.deepcopy(expression)
        for op in operator: # operator => ["*", "-", "*"] -> 하나의 우선순위 조합에 따라서 다 계산해본다.
            temp = []
            for exp in exps: # 현재 exps에 있는 모든 값을 순회해서 체크하기
                if len(temp) != 0 and temp[-1] == op: # 만약 내가 원하는 operator일 경우!...
                    temp.pop()  # 일단 연산자를 temp에서 빼내기
                    first = temp.pop()  # 피 연산자를 temp에서 빼내기
                    temp.append(operate(int(first), int(exp), op))  # 새롭게 계산한 놈을 temp에 넣어주기
                else:
                    temp.append(exp)
            exps = temp
        answer = max(answer, abs(exps[0])) # temp에 있는 값으로 업데이트하기!..(더 클 경우에만)
    return answer
