install.packages("microbenchmark")
library(microbenchmark)

R = makeVector(c(1,2,6))

bench <- microbenchmark(
  r1 = Factorial_loop(4),
  r2 = Factorial_loop(4),
  r3 = Factorial_recursive(4),
  r4 = Factorial_mem(R,4)
)
write.table(bench, file = )
