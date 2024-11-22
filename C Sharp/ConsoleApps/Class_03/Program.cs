// !!!!!!!!!!!!!!!!!!!!!!!!!! Class 03 !!!!!!!!!!!!!!!!!!!!!!!!!! 
// !!!!!!!!!!!!!!!!!!!!!!!!!! Topics !!!!!!!!!!!!!!!!!!!!!!!!!! 
// switch, ternary operator
// Loops (for,While,Do-While,Foreach)
// Loops Controll Statements (Break,Continue)



// !!!!!!!!!!!!!!!!!!!!!!!!!! Student Grade System !!!!!!!!!!!!!!!!!!!!!!!!!! 

string studentName = "Yasir";
int urduMarks = 70;
int englishMarks = 50;
int mathsMarks = 70;
int physicsMarks = 80;
int computerMarks = 40;
decimal totalMarks = 500;
decimal obtainedMarks=urduMarks+englishMarks+mathsMarks+physicsMarks+computerMarks;

//Console.WriteLine(obtainedMarks);
// Obtaind Marks / Total Marks * 100

decimal percentage = obtainedMarks / totalMarks * 100;

string grade = "";

if(percentage >= 80)
{
    grade = "A+";
}
else if(percentage >= 70)
{
    grade = "A";
}
else if (percentage >= 60)
{
    grade = "B";
}
else if (percentage >= 50)
{
    grade = "C";
}
else if (percentage >= 40)
{
    grade = "D";
}
else
{
    grade = "Fail";

}

Console.WriteLine("!!!!!!!!!!!!!!!!!!!! Student Marks !!!!!!!!!!!!!!!!!!!");
Console.WriteLine($"Student Name : {studentName}");
Console.WriteLine($"Student Urdu Marks: {urduMarks}");
Console.WriteLine($"Student English Marks: {englishMarks}");
Console.WriteLine($"Student Maths Marks: {mathsMarks}");
Console.WriteLine($"Student Physics Marks: {physicsMarks}");
Console.WriteLine($"Student Computer Marks: {computerMarks}");
Console.WriteLine($"Student Percentage: {percentage}");
Console.WriteLine($"Student Grade: {grade}");
Console.Write("Student Remarks : ");

switch (grade)
{
    case "A+":
        Console.WriteLine("Very Good Performance");
        break;
    case "A":
        Console.WriteLine("Good Performance");
        break;
    case "B":
        Console.WriteLine("Good");
        break;
    case "C":
        Console.WriteLine("Bad Performance");
        break;
    case "D":
        Console.WriteLine("Bad Performance Need to be Batter");
        break;
    default:
        Console.WriteLine("Batter Luck Next Time ");
        break;

}





// !!!!!!!!!!!!!!!!!!!!! Ternary operator !!!!!!!!!!!!!!!!!!!!!!!

Console.WriteLine("!!!!!!!!!!!!!!!!!!!!! Ternary operator !!!!!!!!!!!!!!!!!!!!!!!");
bool isLogedIn = true;

if (isLogedIn)
{
    Console.WriteLine("You Can Access Admin Panel");
}
else
{
    Console.WriteLine("You Can't Access Admin Panel");
}


// condition ? IF : ELSE


Console.WriteLine(isLogedIn==true ? "You Can Access Admin Panel": "You Can't Access Admin Panel");

int age = 10;

Console.WriteLine(age>18 ? "You Can Vote": "You Can't Vote");




// !!!!!!!!!!!!!!!!!!!!! Loops !!!!!!!!!!!!!!!!!!!!!!!
Console.WriteLine("!!!!!!!!!!!!!!!!!!!!! Loops !!!!!!!!!!!!!!!!!!!!!!!");
Console.WriteLine("!!!!!!!!!!!!!!!!!!!!! For Loops :");

// condition , varibale , inc / dec
for(int a=0;a < 10;a++)
{
    Console.WriteLine($"{a +2} =>{a}<= Inside For Loop");
}

