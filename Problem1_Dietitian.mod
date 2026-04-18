/*********************************************
 * OPL 22.1.2.0 Model
 * Author: wilso
 * Creation Date: Mar 22, 2026 at 11:11:35 AM
 *********************************************/

//sets and parameters
{string} F = ...; //set of food items, indexed by j
{string} N = ...; //set of nutrients, indexed by i
float a[N][F] = ...; //nutrient i content per pound of food j
float L[N] = ...; //lower bound on nutrient i per serving
float U[N] = ...; //upper bound on nutrient i per serving
float c[F] = ...; //cost per pound of food j

//decision variables
dvar float+ x[F]; //pounds of food item j selected (>= 0)

//objective function - minimise total cost per serving
minimize sum(j in F) c[j] * x[j];

//constraints
subject to {
  //lower bound on each nutrient
  forall(i in N)
    ctLower: sum(j in F) a[i][j] * x[j] >= L[i];

  //upper bound on each nutrient
  forall(i in N)
    ctUpper: sum(j in F) a[i][j] * x[j] <= U[i];
}