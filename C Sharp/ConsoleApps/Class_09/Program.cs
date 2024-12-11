namespace Class_09
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine("Hello, World!");

            // !!!!!!!!!!!!!!!!!!! Class 09 !!!!!!!!!!!!!!!!!!
            // !!!!!!!!!!!!!!!!!!! Topics !!!!!!!!!!!!!!!!!!
            // Abstraction & Interfaces
            // Collections


            Teacher t1 = new Teacher(1,"Basit");
            t1.TeacherDetails();
            t1.Morning();

            //Greeting greeting1 = new Greeting();
        }
    }


     abstract class Greeting
    {
        // Abstract Prpoerties
        abstract public int age { get; set; }

        public void Morning()
        {
            Console.WriteLine("Good Morning");
        }

        public void Evening()
        {
            Console.WriteLine("Good Evening");
        }

        public void Night()
        {
            Console.WriteLine("Good Night");
        }

        // Abstract Method
        abstract public void SayHi();
    }

    class Teacher:Greeting {

        public int id { get; set; }
        public string name { get; set; }
        public override int age { get; set; }

        public Teacher(int id,string name)
        {
            this.id = id;
            this.name = name;
        }

        public override void SayHi()
        {
            Console.WriteLine($"Hi, {name}");

        }

        public void TeacherDetails()
        {
            Console.WriteLine("!!!!!!!!!!!!!Teacher Details!!!!!!!!!!!!!");
            Console.WriteLine($"ID : {id}");
            Console.WriteLine($"Name : {name}");
        }

    }

    class Student : Greeting
    {
        public override int age { get; set; }
        public override void SayHi()
        {
            Console.WriteLine("Hi, Student");
        }
    }


    interface ICRUD
    {

        public int Id { get; set; }
        public void Create()
        {
            Console.WriteLine("Create Opteration");
        }

        public void Update();
    }

    interface IAuth
    {

        void Login(string username,string password);
        void Logout();
        void Signup(string usernme,string email, string password);
    }

    class Employee : ICRUD , IAuth 
    {
        public int Id { get; set; }

        public void Login(string username, string password)
        {
            throw new NotImplementedException();
        }

        public void Logout()
        {
            throw new NotImplementedException();
        }

        public void Signup(string usernme, string email, string password)
        {
            throw new NotImplementedException();
        }

        public void Update()
        {
          
        }
    }
}
