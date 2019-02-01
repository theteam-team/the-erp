using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace the_erp_server
{
    class ApplicationDLLWrapper
    {
        [DllImport("the-erp-modules-clr.dll")]
        public static extern IntPtr CreateApp();

        [DllImport("the-erp-modules-clr.dll")]
        public static extern void DeleteApp(IntPtr obj);

        [DllImport("the-erp-modules-clr.dll")]
        public static extern void RunApp(IntPtr obj);
    }
}
