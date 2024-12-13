using System.Collections;

namespace Class_10
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // !!!!!!!!!!!!!!!!!! Class 10 !!!!!!!!!!!!!!!!!!!!
            // !!!!!!!!!!!!!!!!!! Topics !!!!!!!!!!!!!!!!!!!!
            // Collections in C#
            // Generic Collections
            // Non-Generic Collections

            // Non-Generic Collections 
            // ArrayList
            // HashTable
            // Stack
            // Queue

            // Generic Collections
            // List
            // Stack
            // Queue



            // !!!!!!!!!!!!!!!!!!! Non-Generic Collections !!!!!!!!!!!!!!!!!!!


            int[] numbers = {
                10,20,30,40,50
            };


            ArrayList myArryList = new ArrayList();

            myArryList.Add(10);
            myArryList.Add(20);
            myArryList.Add(30);
            myArryList.Add(40);
            myArryList.Add(50);
            myArryList.Add("A");
            myArryList.Add("B");

            Console.WriteLine(myArryList);
            Console.WriteLine(myArryList[2]);


            // For Each

            foreach (var item in myArryList)
            {
                Console.WriteLine(item);
            }


            myArryList.Remove(30);
            //myArryList.Clear();


            myArryList.RemoveAt(1);

            myArryList.Insert(5, "C");
            // For

            for(int i = 0; i < myArryList.Count; i++)
            {
                Console.WriteLine(myArryList[i]);
            }


            // HashTable
            Hashtable ht = new Hashtable();

            ht.Add("id",1);
            ht.Add("name","Yasir");
            ht.Add("age", 23);

            Console.WriteLine(ht["name"]);



            bool res= ht.ContainsKey("city");
            Console.WriteLine(ht.ContainsValue(23));
            Console.WriteLine(res);
            ht.Remove("age");

            foreach(dynamic it in ht)
            {
                //Console.WriteLine(it.Value);
                // Key : Value
                Console.WriteLine($"{it.Key} : {it.Value}");
            }


            // Stack
            Console.WriteLine("!!!!!!!!!!!!!! Stack !!!!!!!!!!!!!");
            // LIFO (Last In Last Out)

            Stack myStack=new Stack();

            myStack.Push(20);
            myStack.Push("React Dev");
            myStack.Push(30);

            foreach (var item in myStack)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine(myStack.Pop());
            Console.WriteLine(myStack.Peek());



            Queue queue = new Queue();
            // FIFO (First In Firt Out)

            queue.Enqueue(20);
            queue.Enqueue(40);
            queue.Enqueue(60);
            foreach (var item in queue)
            {
                Console.WriteLine(item);
            }

            queue.Dequeue();
        }
    }
}
