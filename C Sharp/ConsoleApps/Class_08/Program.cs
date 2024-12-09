namespace Class_08
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // !!!!!!!!!!!!!!!!!!! Class 08 !!!!!!!!!!!!!!!!!!! 
            // !!!!!!!!!!!!!!!!!!! Topics !!!!!!!!!!!!!!!!!!!
            // Geter & Setter
            // Method Overriding
            // Method Overloading
            Console.WriteLine("Hello, World!");

            Person p1 = new Person();
            int id= p1.getId();
            Console.WriteLine(id);
            p1.setId(200);
            p1.setId(20);
            p1.info();

            p1.ID = 30;
            p1.info();
            //p1.salary = 40000; it will give an error beacuse the property is only getter


            Calc calc = new Calc();
            int AddResult= calc.Add(50, 60);
            Console.WriteLine(AddResult);
            AddResult= calc.Add(50, 60,50);
            Console.WriteLine(AddResult);
            double AddResult2= calc.Add(50.00, 60,50);
            Console.WriteLine(AddResult2);


            var c1 = new Car("Toyota", "Camry", "Toyota", 35000.00, 4);
            c1.started();
            c1.info();
        }
    }

    class Person
    {
        private int id;
        private string name;

        public int ID {
            get
            {
                return id!=null ? id :0;
            }
            set
            {
                id = value < 100 ? value : id;
            }
        }

        public double salary { get; }

        public int getId()
        {
            return this.id!=null ? this.id : 0;
        }
         
        public void setId(int id)
        {
            this.id = id < 100 ? id : this.id;
        }

        public void info()
        {
            Console.WriteLine(this.id);
        }
    }

    class Calc
    {

        public int Add(int x,int y)
        {
            Console.WriteLine("Two Paremeters");
            return x + y;
        }
         public int Add(int x,int y,int z)
        {
            Console.WriteLine("Three Paremeters But Return Int");
            return x + y + z;
        }
        public double Add(double x,int y,int z)
        {
            Console.WriteLine("Three Paremeters But Return Double");
            return x + y + z;
        }

        public int Sub(int x, int y)
        {
            return x - y;
        }
        public int Mul(int x, int y)
        {
            return x * y;
        }
        public double Div(double x, double y)
        {
            return x / y;
        }

        public double all(string type, double x,double y)
        {
            switch (type)
            {
                case "+":
                    return x + y;
                case "-":
                    return x - y;
                case "*":
                    return x * y;
                case "/":
                    return x / y;
                default:
                    return x +y;
            }
        }
    }

    class Vehicle
    {
        private string name;
        private string modal;
        private string company;
        protected double price;

        public bool isStarted = false;
        public bool isLightOn = false;



        public Vehicle(string name, string modal, string company, double price)
        {
            this.name = name;
            this.modal = modal;
            this.company = company;
            this.price = price;
        }


        public void started()
        {
            Console.WriteLine("Engine is Started");
            this.isStarted = true;
        }
        public void stop()
        {
            Console.WriteLine("Engine is Stoped");
            this.isStarted = false;
        }

        public void lightOn()
        {
            Console.WriteLine("Light is On");
            this.isLightOn = true;
        }
        public void lightOff()
        {
            Console.WriteLine("Light is Off");
            this.isLightOn = false;
        }

        public void info()
        {
            Console.WriteLine("!!!!!!!!!!! Vehicle Info !!!!!!!!!!!!!");
            Console.WriteLine($"Name : {name}");
            Console.WriteLine($"Modal : {modal}");
            Console.WriteLine($"Company : {company}");
            Console.WriteLine($"Price : ${price}");
            Console.WriteLine(isStarted == true ? "Engine Is Started" : "Engine Is Stoped");

            //if (isStarted == true)
            //{
            //    Console.WriteLine("Engine Is Started");
            //}
            //else
            //{
            //    Console.WriteLine("Engine Is Stoped");
            //}
            if (isLightOn == true)
            {
                Console.WriteLine("Light is On");
            }
            else
            {
                Console.WriteLine("Light is Off");
            }
        }
    }


    class Car : Vehicle
    {

        public int NumberOfDoors;

        public Car(string name, string modal, string company, double price, int numberOfDoor) : base(name, modal, company, price)
        {
            this.NumberOfDoors = numberOfDoor;
        }


        public void info()
        {
            base.info();

            Console.WriteLine($"Number Of Doors : {NumberOfDoors}");
        }

        public void started()
        {
            Console.WriteLine("Car is Started");
            this.isStarted = true;
        }
    }
}
