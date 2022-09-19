#The following SDMM_Function_EMV2 for the SDMM implementation 

# N is the number of status or number of utility matrices.
# Insert the number of status (at least 2)

# M is the number of outcomes.
# Insert the number of outcomes (at least 2)

# B is the number of strategies.
# Insert the number of strategies (at least 2)

# W is the vector of probability of current state.
# We've got N*M states.

# The matrix P is a status transition probability matrix that is a N*N matrix.

# The matrix Q is an outcome transition probability matrix that is a M*M matrix.

# N utility matrices (U) are required which are shown in one array of utility matrices. 
#U is an array of matrices, to read each utility matrix, U[,,i] i=1,...,N should be called.

# The UTS (Utility Status) matrix has got B rows and N*M columns.
# The UTS is constructed by pulling out utility values of strategies from U.

#The matrix S is the state transition probability matrix.

#The ATPFM is the after transition pay off matrix.


SDMM_Function_EMV2 <- function(N,M,B,P,Q,UTS){
  

  # W is the vector of probability of current state.
  # We've got N*M states.
  # We assumed the probabilities in W are equal. 
  #You may decide to insert your own W vector:
  W <- matrix(1/(N*M),nrow=1,ncol=N*M)
  
  

  # The matrix S (state transition probability matrix) will be generated based on your inputs:
  S<-matrix(0,nrow=N*M,ncol=N*M)
  
  for (l in 1:N){
    for (k in 1:N){
      v<-k*M-M+1
      a<-k*M
      for(i in v:a){
        w<-l*M-M+1
        z<-l*M
        for(j in w:z){
          vv<-i-k*M+M
          xx<-j-l*M+M
          S[i,j]<-P[k,l]*Q[vv,xx]
        }
        
      }
      
    }
  }
  

  # The after transition pay off matrix (ATPFM) will be generated:
  
  ATPFM<-matrix(0,nrow=B,ncol=N*M)
  for(i in 1:B){
    for(j in 1:(N*M)){
      ATPFM[i,j]<-crossprod(UTS[i,],S[j,])
      
    }
  }
  
  # Calculating the EMV and presenting the order of strategies:
  EMV<-matrix(0,nrow=B,ncol=1)
  for(i in 1:B){
    EMV[i,1]<-crossprod(ATPFM[i,],W[1,])
    
  }
  
  print(EMV)

  
}


