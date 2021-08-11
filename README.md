# DADDA-MULTIPLIER
 It uses a selection of full and half adders to sum the partial products in stages (the Dadda tree or Dadda reduction) until two numbers are left.
 Dadda  multiplier have the  three steps for two bit strings  w1 and w2  of lengths l1 and l2 respectively:

Multiply (logical AND) each bit of w1, by each bit of w2, yielding l1.l2 results, grouped by weight in columns
Reduce the number of partial products by stages of full and half adders until we are left with at most two bits of each weight.
From final stage we will calculate the capacity of each stage is less than or equal to 3/2 times previous stage capacity.
For example,final stage we have two bits, 3/2 times 2 is 3,so 3 is the capacity of previous stage,
again 3/2 times 3 ,4.5 so 4 is the capacity of previous stage, similarly capacity, 6,9,13.....
Add the final result with a conventional adder.
Here we used brentkung adder.
