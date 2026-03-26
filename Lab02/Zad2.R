Factorial_loop <- function(n = numeric()){
  if(n == 0){
    1
  }
  else{
    mnoznik = 1
    r=1
    while(mnoznik<=n){
      r<-r*mnoznik
      mnoznik <- mnoznik + 1
    }
    r
  }
}

Factorial_loop <- function(n = numeric()){
  if(n==0){
    1
  }
  else{
    Reduce(`*`, seq_len(n) )
  }
}

Factorial_recursive <- function(n = numeric()){
  if(n==0){
    1
  }
  else{
    Factorial_recursive(n-1)*n
  }
}

makeVector <- function(v = c()) {
  get <- function() v
  set <- function() {
    v <<- NULL
  }
  get_silnia <- function(n = numeric()) v[n] # zwracamy silnie dla indeksu
  set_silnia <- function(n,val) v[n] <<- val # dla indeksu wstawiamy silnie
  list(get=get, set = set, get_silnia = get_silnia, set_silnia = set_silnia)
}

Factorial_mem <- function(v, n=0,...) {
  # mamy juz wynik caly
  silnia <- v$get_silnia(n)
  if(!is.na(silnia)) {  # bo jak nie mmay indeksu to zwraca nam na
    message("getting cached data")
    return(silnia)
  }
  # nie mamy aktualnego
  
  silnia <- Factorial_mem(v, n-1)*n
  v$set_silnia(silnia,n)
  silnia
}

