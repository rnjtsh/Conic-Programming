set INTERS; # intersections (network nodes)
param EN symbolic; # entrance
param EX symbolic; # exit
check {EN,EX} not within INTERS;
set ROADS within {INTERS union {EN}} cross {INTERS union {EX}};
# road links (network arcs)
param base {ROADS} > 0; # base travel times
param sens {ROADS} > 0; # traffic sensitivities
param cap {ROADS} > 0; # capacities
param through > 0; # throughput


var Flow {(i,j) in ROADS} >= 0, <= .9999 * cap[i,j];
var Delay {ROADS} >= 0;
minimize Avg_Time:
sum {(i,j) in ROADS} (base[i,j]*Flow[i,j] + Delay[i,j]) / through;
subject to Delay_Def {(i,j) in ROADS}:
sens[i,j] * Flow[i,j]^2 <= (1 - Flow[i,j]/cap[i,j]) * Delay[i,j];
subject to Balance_Node {i in INTERS}:
sum{(i,j) in ROADS} Flow[i,j] = sum{(j,i) in ROADS} Flow[j,i];
subject to Balance_Enter:
sum{(EN,j) in ROADS} Flow[EN,j] = through;