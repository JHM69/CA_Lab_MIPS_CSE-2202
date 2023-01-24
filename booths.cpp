#include <bits/stdc++.h>
using namespace std;
int main()
{
    int mr, md, lsb = 0, n = 16, prodn;
    cout << "\n\nEnter Multiplier (less than " << n << " bits) : ";
    cin >> mr;
    cout << "Enter Multiplicand  (less than " << n << " bits) : ";
    cin >> md;
    bitset<32> prod(mr), mcand(md);
    for (int i = 0; i < n; i++)
    {
        if (prod[0] == 0 && lsb == 1)
        {
            int carry = 0;
            for (int i = 0; i < n; i++)
            {
                bitset<2> result(prod[i + n] + mcand[i] + carry);
                prod[i + n] = result[0];
                carry = result[1];
            }
        }
        else if (prod[0] == 1 && lsb == 0)
        {
            int carry = 0;
            for (int i = 0; i < n; i++)
            {
                bitset<2> result(prod[i + n] - (mcand[i] + carry));
                prod[i + n] = result[0];
                carry = result[1];
            }
        }
        prodn = prod[2 * n - 1];
        lsb = prod[0];
        prod >>= 1;
        prod[2 * n - 1] = prodn;
    }
    cout << "The product is : " << prod << endl;
    cout << "In decimal : " << prod.to_ulong() << endl;
    return 0;
}