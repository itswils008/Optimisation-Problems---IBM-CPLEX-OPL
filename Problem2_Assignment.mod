/*********************************************
 * OPL 22.1.2.0 Model
 * Author: wilso
 * Creation Date: Mar 22, 2026 at 11:57:05 AM
 *********************************************/

 //sets and parameters
{string} S = ...; //set of students, indexed by i
{string} P = ...; //set of projects, indexed by j
int pref[S][P] = ...; //preference rank of student i for project j (1 = most preferred)
int minGroup  = ...; //minimum number of students per project
int maxGroup  = ...; //maximum number of students per project

//decision variables
dvar boolean x[S][P]; //1 if student i is assigned to project j, else 0

//objective function - minimise total preference rank (maximises satisfaction)
minimize sum(i in S, j in P) pref[i][j] * x[i][j];

//constraints
subject to {
  //each student must be assigned to exactly one project
  forall(i in S)
    ctOneProject: sum(j in P) x[i][j] == 1;

  //each project must receive between minGroup and maxGroup students
  forall(j in P) {
    ctMinSize: sum(i in S) x[i][j] >= minGroup;
    ctMaxSize: sum(i in S) x[i][j] <= maxGroup;
  }
}