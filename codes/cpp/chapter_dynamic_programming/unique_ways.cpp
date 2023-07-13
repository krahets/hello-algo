#include <bits/stdc++.h>
using namespace std;
//problem description here
// There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.

// Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.

// The test cases are generated so that the answer will be less than or equal to 2 * 10^9.
int m, n;
// int rec(int i, int j){
    //bottom-up
//     if(i==m-1 and j==n-1)return 1;
//     if(i>=m || j>=n )return 0;
//     int down=rec(i+1, j);
//     int right=rec(i, j+1);
//     return down+right;
// }
int rec(int i, int j){
    if(i==0 && j==0)return 1;
    if(i<0 || j<0)return 0;
    int up=rec(i-1, j);
    int left=rec(i, j-1);
    return up+left;
}
int mem(int i, int j, vector<vector<int>>&dp){
    if(i==0 && j==0)return 1;
    if(i<0 || j<0)return 0;
    if(dp[i][j]!=-1)return dp[i][j];
    return dp[i][j]=mem(i-1, j, dp)+mem(i, j-1, dp);
}
int dpTab(){
    vector<vector<int>>dp(m, vector<int>(n, 0));
    dp[0][0]=1;
    //only one way to get there from 0 to 0
    for(int i=0; i<m; i++){
        for(int j=0; j<n; j++){
            if(i==0 || j==0)dp[i][j]=1;
            else{
                dp[i][j]=dp[i-1][j]+dp[i][j-1];
            }
        }
    }
    return dp[m-1][n-1];
}
int space(){
    vector<int>prev(n, 0);
    for(int i=0; i<m; i++){
        vector<int>temp(n, -1);
        for(int j=0; j<n; j++){
            if(i==0 || j==0)temp[j]=1;
            else{
                int up=i?prev[j]:0;
                int left=j?temp[j-1]:0;
                temp[j]=up+left;
            }
        }
        prev=temp;
    }
    return prev[n-1];
}
int main()
{
    cin>>m>>n;
    cout<<rec(m-1, n-1)<<endl;
    vector<vector<int>>dp(m, vector<int>(n,-1));
    cout<<mem(m-1, n-1, dp)<<endl;
    cout<<dpTab()<<endl;
    cout<<space();
    return 0;
}
