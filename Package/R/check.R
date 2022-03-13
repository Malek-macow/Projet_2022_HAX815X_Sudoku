

check = function(A){
  H=matrix(0,9,9)
  if (isFALSE(all(!is.na(A)))){return(FALSE)}
  for (i in 1:9){
    for (j in 1:9){
      K = A[i,j]
      if(is_valid(A,i,j,K)){
        H[i,j] <- TRUE
      }else {H[i,j] <- FALSE}
    }
  }
  if(all(H==1)){return(TRUE)
    }else return(FALSE)
}
