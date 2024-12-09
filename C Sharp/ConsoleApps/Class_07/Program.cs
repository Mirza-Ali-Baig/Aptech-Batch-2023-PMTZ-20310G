namespace Class_07
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // !!!!!!!!!!!!!!!!! Class 07 !!!!!!!!!!!!!!!
            // !!!!!!!!!!!!!!! Topics !!!!!!!!!!!!!!!
            // Inheritance
            // Constructor Inheritance
            // Encapsulation


            var v1 = new Vehicle("BMW", "X5", "BMW", 90000);
            //v1.price = "";

            //v1.started();
            v1.info();

            var c1 = new Car("Toyota", "Camry", "Toyota", 35000.00,4);
            c1.info();
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
    }
}
