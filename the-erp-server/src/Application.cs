using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace the_erp_server
{
    public class Application
    {
        IntPtr instancePtr;

        public Application()
        {

            instancePtr = ApplicationDLLWrapper.CreateApp();
        }

        public void Run()
        {
            ApplicationDLLWrapper.RunApp(instancePtr);
        }

        ~Application()
        {
            ApplicationDLLWrapper.DeleteApp(instancePtr);
        }
    }
}
