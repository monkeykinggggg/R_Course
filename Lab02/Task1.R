Rprof("profilowanie.out")
suma <- sum(1:1e6)
Rprof(NULL)
summaryRprof("profilowanie.out")
