#Maze
solve mazes with breadth first and depth first search. 

###Introduction:
This is a maze solving application for macOS, build with SpriteKit and Xcode. It can take in .txt maze data and solve in with breadth first search or depth first search. 

###Depth First Search:
This is a very popular searching/graph algorithms. It's similar to brute-force and will not fail. 

Worst-case performance: O(|E|) for explicit graphs traversed without repetition, O(b^d) for implicit graphs with branching factor b searched to depth d

Worst-case space complexity O(|V|) if entire graph is traversed without repetition, O(longest path length searched) for implicit graphs without elimination of duplicate nodes

###Breadth First Search: 
[1]
Breadth-first search (BFS) is an algorithm for traversing or searching tree or graph data structures. It starts at the tree root (or some arbitrary node of a graph, sometimes referred to as a 'search key') and explores the neighbor nodes first, before moving to the next level neighbors.

BFS was invented in the late 1950s by E. F. Moore, who used it to find the shortest path out of a maze,[2] and discovered independently by C. Y. Lee as a wire routing algorithm (published 1961).

Worst case performance: O(|E|)=O(b^d) <br>
Worst case space complexity: O(|V|)=O(b^d)


###Credit & Copyright:
Developed by: Neil Nie <br>
Resource from Wikipedia <br>
License: MIT