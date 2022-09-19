# RShiny_SDMM
R Shiny code for the Stratified Decision Making Model

The main R Shiny app code is named SDMM_WebApp.R

The SDMM_WebApp.R calls the function SDMM_Function_EMV2.R

The SDMM_Function_EMV2 for the SDMM implementation has 6 arguments which are N,M,B,P,Q and UTS. These arguments are explained as below:

The N is the number of status or number of utility matrices (at least 2).

The M is the number of outcomes(at least 2).

The B is the number of strategies (at least 2).

The W is the vector of probability of current state. (N*M states).

The matrix P is a status transition probability matrix that is a N*N matrix.

The matrix Q is an outcome transition probability matrix that is a M*M matrix.

The N utility matrices (U) are required which are shown in one array of utility matrices. 

The U is an array of matrices, to read each utility matrix, U[,,i] i=1,...,N should be called.

The UTS (Utility Status) matrix has got B rows and N*M columns.
The UTS is constructed by pulling out utility values of strategies from U.

The matrix S is the state transition probability matrix.

The ATPFM is the after transition pay off matrix.

The EMV is the Expected Monetary Value.
