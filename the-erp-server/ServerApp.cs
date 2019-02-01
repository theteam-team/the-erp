using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;


namespace the_erp_server
{
    

    class ServerApp
    {
        // Testing importing Funcions
        [DllImport("the-erp-modules-clr.dll")]
        public static extern void Print();

        // Testing importing class
        static Application module = new Application();

        static void Main(string[] args)
        {
                  
            Print();

            module.Run();

            //Console.ReadKey();

            // Go to http://aka.ms/dotnet-get-started-console to continue learning how to build a console app! 
        }
    }
}
