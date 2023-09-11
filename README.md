# selfish-gene-simulator
Processing project

Run final_project.pde

### Features
Visually simulate a species with two types of genes: selfishness, and the rest.

- Starting screen
  - Choose three types of reproductions: asexual, sexual, parthenogenesis
  - Determine how much the species can reproduce with a slider
  - Determine how long a specimen can survive after reproduction

<img src="https://raw.githubusercontent.com/jwkimOwl/Selfish-Gene-Simulator/master/screenshots/1.png" width="250">

- Simulating screen
  - Average, highest, lowest level of selfishness and the population on display
  - If altruism(proportional to the likeness and number of othem specimens) is bigger than the specimen's selfishness, the specimen sacrifices itself
  - When the red block's number gets to 100, it kills specimens until the population is under 51

<img src="https://raw.githubusercontent.com/jwkimOwl/Selfish-Gene-Simulator/master/screenshots/2.png" width="250">

- Specimen
  - The top triangle representing selfishness, the redder, the more selfish
  - Remaining four squares representing reamaing genes, to analyze the level of homogeneity
  - Every gene mutates by certain probability at reproduction
  - The green bar above representing age compared to the life span
  - Black X if it is infertile
  - Angle ring for a sacrificed specimen

<img src="https://raw.githubusercontent.com/jwkimOwl/Selfish-Gene-Simulator/master/screenshots/3.png" width="250"> &emsp;&emsp;&emsp;<img src="https://raw.githubusercontent.com/jwkimOwl/Selfish-Gene-Simulator/master/screenshots/4.png" width="100">
