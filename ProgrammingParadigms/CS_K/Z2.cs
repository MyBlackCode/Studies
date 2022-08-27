using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CS_K
{
    public static class Z2
    {
        public static Func<T1, Func<T2, TWynik>> Curry<T1, T2, TWynik>(Func<T1, T2, TWynik> funkcja) =>
            (T1 v1) => (T2 v2) => funkcja(v1, v2);
    }
}
