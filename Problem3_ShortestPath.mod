/*********************************************
 * OPL 22.1.2.0 Model
 * Author: wilso
 * Creation Date: Mar 22, 2026 at 1:04:55 PM
 *********************************************/

//user-defined data structure - arc carries its own travel time
tuple arc {
  int  orig; //origin node of the arc
  int  dest; //destination node of the arc
  int  time; //walking time (minutes) along this arc
}

//sets and parameters
int   nNodes = ...;      // read from .dat
range N      = 1..nNodes; // derived in the model
{arc}  A = ...;  //set of directed arcs (each undirected path split into two)
int source = ...; //origin node - Hospital Administration Block (3)
int sink   = ...; //destination node - Nightingale Ward (8)

//decision variables
dvar float+ x[A]; //flow on arc a: 1 if on the shortest path, 0 otherwise

//objective function - minimise total walking time
minimize sum(a in A) a.time * x[a];

//constraints
subject to {
  //flow balance at every node
  forall(k in N)
    ctFlow: sum(a in A: a.orig == k) x[a] - sum(a in A: a.dest == k) x[a]
            == (k == source ? 1 : (k == sink ? -1 : 0));

  //capacity: at most one unit of flow on any arc
  forall(a in A)
    ctCapacity: x[a] <= 1;
}