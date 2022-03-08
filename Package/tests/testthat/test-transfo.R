test_that("Tester la fonction transfo", {
  A = matrix(data=c(
    NA,4,8,2,1,5,9,3,7,
    5,7,9,4,8,3,NA,2,1,
    2,1,NA,9,7,6,8,5,4,
    7,9,2,3,6,4,5,1,NA,
    3,NA,1,8,NA,7,4,9,2,
    8,5,4,1,2,9,7,6,3,
    9,NA,5,7,3,8,1,4,6,
    4,3,7,6,9,1,2,NA,5,
    1,8,6,NA,4,2,3,7,9), nrow=9, ncol=9, byrow=FALSE
  )
  B = is.na(transfo(A))
  if (sum(B)==0)
    expect_true(TRUE)
  else{expect_true(FALSE)}
})
