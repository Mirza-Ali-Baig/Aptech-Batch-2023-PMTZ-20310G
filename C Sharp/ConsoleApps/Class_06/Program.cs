namespace Class_06
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // !!!!!!!!!!!! Class 06 !!!!!!!!!!!!!!!!
            // !!!!!!!!!!!! Topics !!!!!!!!!!!!!!!!
            // !!!!!!!!!!!! var, Object , Dynamic !!!!!!!!!!!!!!!!

            //int a = 10;
            //a = "hello";

            //var a = "20";
            //a = "20";
            //a = 20;

            //object a = 30;
            //a = "40";

            //dynamic a = 50;
            //a = "60";

            // Class
            // This Keyword
            // Objects
            // Properties & Methods
            // Access Modifiers (public , Private , Protected ) 
            // Constructor

            Console.WriteLine("Hello, World!");


            //User.id

            // Objects
            Console.WriteLine("!!!!!!!! u1 !!!!!!!!!!!");
            var u1 = new User();
            u1.info();
            Console.WriteLine("!!!!!!!! u2 !!!!!!!!!!!");
            var u2 = new User();
            u2.id = 2;
            u2.name = "Basit";
            u2.password = "123";
            u2.info();
            Console.WriteLine("!!!!!!!! u3 !!!!!!!!!!!");
            var u3 = new User();
            u3.id = 3;
            u3.name = "Usman";
            u3.password = "12345";
            u3.info();
            Console.WriteLine("!!!!!!!! u4 !!!!!!!!!!!");
            var u4 = new User();
            u4.id = 4;
            u4.name = "Hassan";
            u4.password = "admin123";
            u4.info();


            Console.WriteLine("!!!!!!!! e1 !!!!!!!!!!!");
            var e1 = new Employee(1,"Talha", "talha@gmail.com", "03438764376", "IT", 20000.00);
            e1.print();
            //Console.WriteLine(e1.id);
            //e1.setId(1);
            //Console.WriteLine(e1.id);
            //e1.setValues("Talha", "talha@gmail.com", "03438764376", "IT", 20000.00);
            Console.WriteLine("!!!!!!!! e2 !!!!!!!!!!!");
            var e2=new Employee(2,"Yasir", "yasir@gmail.com", "03434763254376", "HR", 10000.00);
            //e2.setValues("Yasir", "yasir@gmail.com", "03434763254376", "HR", 10000.00);
            e2.print();

        }
    }

    // Create a Class
    class User
    {
        // Properties
        public int id=1;
        public string name="Kuch Bhi Nhi";
        public string password="Mujhe Nhi Pata";

        // Methods

        public void info() 
        {
            // Format Message
            // id : 1
            // name :  Kuch Bhi Nhi
            // password :  Mujhe Nhi Pata
            // Using Concat
            Console.WriteLine("Id : " + id);
            Console.WriteLine("Name : " + name);
            Console.WriteLine("Password : " + this.password);

            // Using String Interpolation
            Console.WriteLine($"Id : {id}, Name : {name}, Password : {password}");
            // Using Placeholder
            Console.WriteLine("Id : {0}, Name : {1}, Password : {2}",name,id,password);
        }
    }

    class Employee
    {
        public int id; 
        public string name; 
        public string email; 
        public string phone; 
        public string department;
        public double salary;
        

        // Constructor
        public Employee(int id, string name, string email, string phone, string depertment, double salary)
        {
            this.id = id;
            this.name = name;
            this.email = email;
            this.phone = phone;
            this.department = depertment;
            this.salary = salary;
        }

        public void setId(int id)
        {
            this.id = id;
        }

        public void setValues(string n,string e, string p,string d, double s)
        {
            this.name = n;
            this.email = e;
            this.phone = p;
            this.department = d;
            this.salary = s;
        }


        public void print()
        {
            Console.WriteLine
            ($"ID : {id}, Name : {name}, Email : {email}, Phone : {phone}, Department : {department}, Salary : {salary}");
        }
    }
}
