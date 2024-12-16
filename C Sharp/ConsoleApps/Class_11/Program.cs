using System.Collections.Generic;

namespace Class_11
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // !!!!!!!!!!!!!!!!! Class 11 !!!!!!!!!!!!!!!!!!
            // !!!!!!!!!!!!!!!!! Topics !!!!!!!!!!!!!!!!!!
            // Collections
            // Generic Collections
            // List
            // Dictionary
            // Stack
            // Queue

            List<int> numbers = new List<int>();


            numbers.Add(10);
            // numbers.Add("20");

            numbers.Add(20);
            //numbers


            foreach (int number in numbers)
            {
                Console.WriteLine(number);
            }


            List<string> names = new List<string>() { 
                "Taha",
                "Talha",
                "Basit"
            };


            foreach (string name in names)
            {
                Console.WriteLine(name);
            }

            Console.WriteLine("While Loop !!!!!!!!!!!!");
            int i = 0;

            while(i < 3)
            {
                Console.WriteLine(names[i]);
                // i=2; // Replace
                i += 1; // Increment

                // Console.WriteLine(names[i]);
            }

           Dictionary<string,string> user=new Dictionary<string,string>();

            user.Add("id", "10");
            user.Add("name", "Qasim");
            user.Add("email", "qasim@gmail.com");


            foreach (var item in user)
            {
                // Console.WriteLine(item.Value);

                Console.WriteLine($"Key : {item.Key} Value : {item.Value}");
            }


            Stack<double> decimals = new Stack<double>();

            decimals.Push(100.00);
            decimals.Push(200.00);
            decimals.Push(300.00);

            decimals.Pop();

            foreach (var item in decimals)
            {
                Console.WriteLine(item);
            }

            Queue<string> namesQueue = new Queue<string>();

            namesQueue.Enqueue("1");
            namesQueue.Dequeue();


            List<Student> students = new List<Student>();

            students.Add(new Student("Yasir", "Yasir@gmail.com"));
            students.Add(new Student("Khan", "khan@gmail.com"));
            students.Add(new Student("Basit", "basit@gmail.com"));
            students.Add(new Student("usman", "usman@gmail.com"));

            foreach (Student item in students)
            {
                item.info();
            }



            // Exception Hendling / Error Hendling


            //string Sname=Console.ReadLine()!;

            //Console.WriteLine("Hello " + Sname);


            Console.WriteLine("Enter Value 1 :");
            string value1=Console.ReadLine()!;
            Console.WriteLine("Enter Value 2 :");
            string value2=Console.ReadLine()!;
            Console.WriteLine(value1 + value2);

            //int ConvertValue1 = int.Parse(value1);
            //int ConvertValue2 = int.Parse(value2);
            //Console.WriteLine(ConvertValue1 + ConvertValue2);

            try
            {
                int ConvertValue1 = int.Parse(value1);
                int ConvertValue2 = int.Parse(value2);
                Console.WriteLine(ConvertValue1 + ConvertValue2);
            }
            catch (FormatException erorr)
            {
                //Console.WriteLine(erorr.Message);
                Console.WriteLine("Error To Convert String Into Integer");
            }


            Console.WriteLine("!!!!!!!!!!!!!!!!!!!!");
            Console.WriteLine("!!!!!!!!!!!!!!!!!!!!");
            Console.WriteLine("!!!!!!!!!!!!!!!!!!!!");
            Console.WriteLine("!!!!!!!!!!!!!!!!!!!!");
            Console.WriteLine("!!!!!!!!!!!!!!!!!!!!");
            Console.WriteLine("!!!!!!!!!!!!!!!!!!!!");
        }

        class Student
        {
            private string name;
            private string email;

            public Student(string name, string email)
            {
                this.name = name;
                this.email = email;
            }

            public void info()
            {
                Console.WriteLine($"!!!!!!!!!!!! Student Info !!!!!!!!!!!");
                Console.WriteLine($"Name : {name}");
                Console.WriteLine($"Email : {email}");
            }


        }
    }
}
