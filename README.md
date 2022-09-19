# Project name

RShiny_SDMM




# Description

The R Shiny code and required files for the stratified decision-making model 


# How to Use

You can run the app in the R Studio.

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


# References


# Author info

Check out my personal website: https://vafadarnikjoo.net/

# Cite the code 


# License
MIT License

Copyright (c) 2022 Amin Vafadarnikjoo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.




