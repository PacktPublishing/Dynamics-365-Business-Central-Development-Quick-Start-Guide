using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

using D365BCWebServiceClient.D365BCWS;

namespace D365BCWebServiceClient
{
    class Program
    {
        static void Main(string[] args)
        {
            string WSKey = "WOpmr3C4RwHfRfDacAa8tHlrMwbVBc+YKJuyo5OXNls=";

            //Create an instance of the D365BC SOAP WS
            Customer_Service ws = new Customer_Service();
            ws.Url = "https://api.businesscentral.dynamics.com/v1.0/194e87bd-73c6-43c6-95d7-1ca48985db5e/WS/CRONUS%20IT/Page/Customer";
            //Handling authentication
            System.Net.CredentialCache myCredentials = new System.Net.CredentialCache();
            NetworkCredential netCred = new NetworkCredential("sdemiliani", WSKey);
            myCredentials.Add(new Uri(ws.Url), "Basic", netCred);
            ws.Credentials = myCredentials;

            //Read Customers
            //List<Customer_Filter> filters = new List<Customer_Filter>();
            //Customer_Filter filter = new Customer_Filter();
            //filter.Field = Customer_Fields.Country_Region_Code;
            //filter.Criteria = "IT";
            //filters.Add(filter);
            //try
            //{
            //    foreach (Customer customer in ws.ReadMultiple(filters.ToArray(), "", 0))
            //    {
            //        Console.WriteLine("No: {0} Name: {1}", customer.No, customer.Name);
            //    }
            //}
            //catch (Exception ex)
            //{
            //    Console.WriteLine("Error retrieving Customers: {0} InnerException: {1}", ex.Message, ex.InnerException);
            //}

            //Create the Customer record
            Customer customer = new Customer();
            customer.Name = "SOAP Customer";
            customer.Address = "Viale Kennedy 87, Novara";
            customer.Country_Region_Code = "IT";
            customer.Blocked = Blocked.All;
            try
            {
                //Start the Create method
                ws.Create(ref customer);
                Console.WriteLine("Customer {0} created successfully.", customer.No);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Customer creation error: {0} InnerException: {1}", ex.Message, ex.InnerException);
            }
        }
    }
}
