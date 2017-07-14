# Abstract
This repository contains implementation of Territory defining evolutionary algorithm. The implementation is a part of my second year internship at IIT kharagpur. Job shop schedulling problem has been solved using TDEA algorithm. This problem is a classic case of process planning & schedulling in operations.

## Base research papers
[first paper](https://github.com/x0v/TDEA-Genetic-Algorithm/blob/master/pdf/karahan2010.pdf) | [second paper](https://github.com/x0v/TDEA-Genetic-Algorithm/blob/master/pdf/koksalan2010.pdf)


## Ref research papers to understand Job shop schedulling problem. 
> Apart from this many other papers were referenced learning multiobjective evolutionary alorithms.

[Input data reference 1 - 6X6 | 8X8](https://github.com/x0v/TDEA-Genetic-Algorithm/blob/master/pdf/Data%20was%20taken%20from%20this%20paper.pdf) | [Input data reference 2 - 6X8](https://github.com/x0v/TDEA-Genetic-Algorithm/blob/master/pdf/multi-objec1.pdf) | [Reference 3](https://github.com/x0v/TDEA-Genetic-Algorithm/blob/master/pdf/my%20paper.pdf) | [Reference 4](https://github.com/x0v/TDEA-Genetic-Algorithm/blob/master/pdf/shao.pdf)


## Algorithm Outline
```
*Step 1*: Set up the parameters of MGA for the optimization of process planning.

*Step 2*: Generate an initial population (i.e. *regular population, P*)

The *regular population* *P*, is formed by randomly creating individuals at the beginning of the algorithm until its maximum
size N is reached. It may contain both nondominated and dominated individuals.

*Step 3*: create the *archive population A. The *archive* *A*, consists of only nondominated individuals. It is created from the copies of the nondominated individuals of *P*. Although its size is not explicitly restricted by a fixed number, it depends on *τ* that defines the size of the territory of an individual. Only the individuals that are accepted to the
regular population are eligible to be evaluated to enter the archive.

*Step 4*: Evaluate the initial population: calculate the objective Function.*

*Step 5*: Parent Selection: The selection scheme is different for the
two populations. In the regular population, the binary tournament
selection is used.

Pick two individual *s1* and *s2* from the regular population and parent
p1 is determined according to the following procedure:

1.  Test for dominance between *s1* and *s2*. If one dominates the
    other, denote the dominating individual as the first parent *p1.*

2.  If there is no dominance relation, then select randomly among *s1*
    and *s2*.

3.  The second parent *p2* is randomly archive population.
    Since all individuals in the archive are nondominated relative
    to each other, we randomly choose one individual as p2.

In this selection tournament size is not strict. If a larger selection
pressure is desired, a larger tournament size can be set. Also, parents
that compete in the tournament selection can be chosen from any population freely.

*Step 6*: Two point crossover is used for process planning as well as
scheduling chromosome.Since crossover and mutation operators are not
specific to our algorithm,we have not used them.

This step includes:

(i)Two random point are selected for process planning.

(ii)for scheduling level the genes corresponding to process planning
level,are randomly generated again & replaced by their previous values.

In this way crossover is done on the individuals selected from the step
5 and then forwarded for mutation.

Step:7 Mutation is performed on the offspring.

Now the individuals created by (mutation+crossover) and only(crossover)
are checked for their fitnesses.Hence fittest offspring is allowed to
propagate further to enter into the regular and archive population.

*Step 8*: *Population Updates*

An offspring, *c*, is first evaluated for acceptance into the
regular population. The evaluation procedure is as follows.

1) Test *c* against each individual *si* ∈ *P*(*t*) for dominance. Mark the individuals dominated by *c*. If *c* is dominated by at least one *si*, reject *c*. Otherwise, go to the next step.

2) Remove one of the marked individuals randomly from *P*(*t*). If no individuals are marked, choose and remove
an individual randomly from *P*(*t*).

3) Insert *c* into *P*(*t*) and test for acceptance in *A*(*t*). If *c* is rejected in the above procedure, then it is not evaluated for archive acceptance at all. The archive evaluation process consists of two stages.

First, the offspring *c* is checked for dominance against the members of the archive. If it is not dominated by any individual in the archive, then we proceed to the second stage. The second stage begins with the removal of individuals  dominated by *c* from the archive. After that, we determine the closest individual, *si*\*, to *c* in terms of the scaled rectilinear distance. Then, we check whether *c* is in the territory of *si*\*. If it is, we reject *c*. Otherwise, *c* is
accepted.

1.  Test *c* against each individual ∈*A*(*t*) for dominance. Mark the
    individuals dominated by *c*. If *c* is dominated by at least one,
    reject *c*. Otherwise, go to the next step.

2.  Remove all marked individuals from *A(t).*

3.  If *A*(*t*) is empty, accept and insert *c* into *A*(*t*) and stop.
    Otherwise, continue to next step.

4.  Defining as the scaled value of individual *i* in objective *j*.
    Calculate the rectilinear distance of c to each individual ∈*A(t).*

5.  Find, that is, the individual closest to *c*.

6.  Find the maximum scaled absolute objective difference between *c*
    and . That is, find

7.  In TDEA, *τ* defines the territory size, if, accept and insert c
    into A(t). Otherwise, reject c.

For scaling i have used exponential scaling function

F(x)=e<sup>-xa</sup>

Where a is any constant & x is objective value.
```

## Results - Gantt charts

	
<img src="https://github.com/x0v/TDEA-Genetic-Algorithm/blob/master/gantt%20charts/pra66.JPG" width="1000">


                                        6 x 6 result

<img src="https://github.com/x0v/TDEA-Genetic-Algorithm/blob/master/gantt%20charts/PRA68.JPG" width="1000">


                                        6 x 8 result

<img src="https://github.com/x0v/TDEA-Genetic-Algorithm/blob/master/gantt%20charts/PRA88.JPG" width="1000">


                                        8 x 8 result
