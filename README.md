## Knights Travalis

Assignment from The Odin Project for practice on recent subjects including node based data structures and search algorithms.

Task: create a chess board and a knight game piece; create a function which given the starting position of the knight and another square on the board, returns the shortest path (how many moves and each square the knight will stop at along the way).

This one caused me a bit of trouble. Having just finished contructing a binary search tree, my brain kept visualizing the solution with each square having 'children' of possible moves and those children having potentially 8 more children and so on, so that the root node (the knights starting position) would have somewhere up to 512 decendents. Of course, with this being part of the solution in my mind, i couldn't grasp how I would search through those descendents in a meaningful way, constructing the shortest path along the way. I tried many different ideas and implementations until I decided I needed help.

Help was found glancing at fellow student qpongratz's code and seeing how they reversed the relationship of parent/child so that each square had, not children, but one parent. With this insight, it then made sense how I could easily use Breadth First Search to trace backwards in lineage.      