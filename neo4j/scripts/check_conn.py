from py2neo import Graph
graph = Graph("bolt://localhost:7687", auth=("neo4j", "koima10is@jaP"))

try:
    graph.run("Match () Return 1 Limit 1")
    print('ok')
except Exception:
    print('not ok')
