#include <iostream>
// #include <cctype>
// #include <algorithm>

using namespace std;

// Implement a simple sort algorithm!

int sum_from_k_to_n(int k, int n) {
    int sum = 0;
    for(int i = k; i <= n; i++) {
        if(i & 1) // odd
            sum += (i * i);
        else
            sum += (i + i);
    }
    return sum;
}

int maxProfit(vector<int>& prices) {
        int smallest = prices[0];
        int max_profit = 0;

        for(int i = 1; i < prices.size(); i++) {
            if(prices[i] < smallest)
                smallest = prices[i];
            else {
                int profit = prices[i] - smallest;
                if(max_profit < profit)
                    max_profit = profit;
            }
        }

        return max_profit;
    }

int Sum_n(int n, int k) {
    // sum of first k numbers (including the kth number)
    int i = 0;
    int sum_n = 0;
    while(i < n) {
        if (i == k)
            break;
        i++;
        sum_n += i;
    }
    return sum_n;
}

int test(int n, int k) {
    return Sum_n(n, k);
}

int main() {
    int x = 5;
    return 0;
}