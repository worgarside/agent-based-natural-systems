# Herd Immunity ABM Assignment

## Team Members:
- Will Garside - worgarside@gmail.com
- Rufus Cope - rcope2@sheffield.ac.uk
- Henry Westmacott - hwestmacott1@sheffield.ac.uk
- Ignas Vaidogas - ivaidogas1@sheffield.ac.uk

## Description:

_Herdlab_ is an Agent-Based Model which simulates th spread of an infectious disease in a population. There are 3 types of agents: **susceptible**, represented by blue dots and susceptible to infection; **vaccinated**, green dots which cannot be infected; and **infected** the red dots which pass the infection on to the vulnerable agents.

## Instructions

`herdlab` can be run with between 5 and 7 arguments, in the following form:

```
herdlab(env_size, vuln_count, vacc_count, infec_count, step_count, plot_control, img_output)

env_size     -  number, the size of the (square) environment
susc_count   -  number, initial quantity of vulnerable agents
vacc_count   -  number, initial quantity of vaccinated agents
infec_count  -  number, initial quantity of infected agents
step_count   -  number, number of steps to run the simulation for
plot_control -  number, how often to plot the data (0 = final plot only)
quick_stop   -  bool, whether or not to stop when the number of susceptible/infected drops to 0
img_output   -  bool, save the plots as jpeg files when they are plotted
```

Alternatively, `run_tests` can be run, and it will produce 7 graphs. The parameters for these graphs can be modified within the file `run_tests.m`.
