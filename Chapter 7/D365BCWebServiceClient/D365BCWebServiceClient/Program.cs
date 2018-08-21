using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

using D365BCWebServiceClient.D365BCItemService;

namespace D365BCWebServiceClient
{
    class Program
    {
        static void Main(string[] args)
        {
            string WSKey = "YOURWEBSERVICEACCESSKEY";
            string WSURL = "https://api.businesscentral.dynamics.com/v1.0/194e87bd-73c6-43c6-95d7-1ca48985db5e/WS/CRONUS%20IT/Page/Item";

            //Create an instance of the D365BC SOAP WS     
            BasicHttpBinding binding = new BasicHttpBinding();
            binding.Security.Mode = BasicHttpSecurityMode.Transport;
            binding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Basic;
            
            D365BCItemService.Item_PortClient ws = new Item_PortClient(binding, new EndpointAddress(WSURL));            
            ws.ClientCredentials.UserName.UserName = "YOURUSERNAME";
            ws.ClientCredentials.UserName.Password = WSKey;            

            //Creating the filters
            List<Item_Filter> filters = new List<Item_Filter>();
            Item_Filter filter = new Item_Filter();
            filter.Field = Item_Fields.No;
            filter.Criteria = "1900-S";
            filters.Add(filter);  
            try
            {
                foreach (Item item in ws.ReadMultiple(filters.ToArray(), "", 0))
                {
                    Console.WriteLine("No: {0} Name: {1}", item.No, item.Description);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error retrieving Items: {0} InnerException: {1}", ex.Message, ex.InnerException);
            }

            Console.ReadKey();

            
        }
    }
}
