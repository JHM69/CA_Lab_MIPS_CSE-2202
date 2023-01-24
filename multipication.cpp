#include <bits/stdc++.h>
using namespace std;
int main()
{
    int mr=3, md=2, n = 16;
    cout << "\n\nEnter Multiplier  : ";
    cin >> mr;
    cout << "Enter Multiplicand  : ";
    cin >> md;
    bitset<16> mcand(md);
    bitset<32> mplier(mr), prod;
    for (int i = 0; i < n; i++)
    {
        if (mcand[0] == 1)
        {
            int carry = 0;
            for (int i = 0; i < n; i++)
            {
                bitset<2> result(prod[i] + mplier[i] + carry);
                prod[i] = result[0];
                carry = result[1];
            }
        }
        mcand >>= 1;
        mplier <<= 1;
    }
    cout << "The product is : " << prod << endl;
    cout << "In decimal : " << prod.to_ulong() << endl;
    return 0;
}