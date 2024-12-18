using System.IO;
namespace Class_12
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // !!!!!!!!!!!!!!!!!!!!!! Class 12 !!!!!!!!!!!!!!!!!!!!
            // !!!!!!!!!!!!!!!!!!!!!! Topics !!!!!!!!!!!!!!!!!!!!
            // Exception Hendling
            // Try Catch
            // Try with Multiple Catch
            // Try With Exception Class
            // Finally
            // Throw Error

            // File Hendling
            // Create
            // Copy
            // Move
            // Read
            // Write
            // Delete
            // File static


            //int[] myArray =new int[3];


            //myArray[0] = 5;
            //myArray[1] = 10;
            //myArray[2] = 15;
            //myArray[3] = 20;
            //myArray[4] = 25;

            // try / catch




            //Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!");
            //Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!");
            //Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!");
            //Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!");


            //try
            //{
            //    Console.WriteLine("Enter Num1 :");
            //    int num1 = int.Parse(Console.ReadLine());
            //    int[] myArray = new int[3];

            //    myArray[0] = 5;
            //    myArray[1] = 10;
            //    myArray[2] = 15;
            //    myArray[3] = 20;
            //    myArray[4] = 25;


            //    Console.WriteLine(num1);
            //}
            //catch (IndexOutOfRangeException ex)
            //{
            //    Console.WriteLine(ex.Message);
            //}
            //catch (FormatException ex)
            //{
            //    //Console.WriteLine(ex.Message);
            //    Console.WriteLine("Invalid Value");
            //}
            //catch (Exception ex) {
            //    Console.WriteLine(ex.Message);
            //}

            //Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!");
            //Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!");
            //Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!");
            //Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!");




            //bool isLoading=false;

            //try
            //{
            //    isLoading = true;

            //       // ApI Call 
            //       // 5s

            //    //isLoading = false;
            //    Console.WriteLine("This is Try");

            //}
            //catch (Exception ex) {
            //    Console.WriteLine(ex.Message);
            //    //isLoading = false;
            //    Console.WriteLine("This is Catch");
            //}
            //finally
            //{
            //    isLoading=false;
            //    Console.WriteLine("This is Finally");
            //}


            //throw new Exception("This is Throw");



            string filePath = @"C:\Users\Admin\Documents\demo1.txt";
            // \t , \n


            bool isFileExist= File.Exists(filePath);
            Console.WriteLine(isFileExist);

            if (isFileExist==true) {
                Console.WriteLine("File Exists");
                File.Delete(filePath);
            }
            else
            {
                Console.WriteLine("File Not Exists");

                File.Create(filePath);

            }


            Console.WriteLine(isFileExist ? "File Exists" : "File Not Exists");


            string imagePath = @"C:\Users\Admin\Desktop\img.jpg";
            string imagePath2 = @"C:\Users\Admin\Documents\img.jpg";

            if (File.Exists(imagePath)){
                File.Copy(imagePath, imagePath2,true);
            }

        }
    }
}
