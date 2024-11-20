// !!!!!!!!!!!!!!!!!!!!!!! Class 02 !!!!!!!!!!!!!!!!!!!!!!!!
// !!!!!!!!!!!!!!!!!!!!!!! Topics !!!!!!!!!!!!!!!!!!!!!!!!
// Operators
// Controll-Flow (if, else ,else if,switch, ternary operator)


Console.WriteLine("!!!!!!!!!!!!!!!!!!!!! Start !!!!!!!!!!!!!!!!!!!!!!!!!!!");

// !!!!!!!!!!!!!!!!!!!!!!! Operators !!!!!!!!!!!!!!!!!!!!!!!!
Console.WriteLine("!!!!!!!!!!!!!!!!!!!!! Operators !!!!!!!!!!!!!!!!!!!!!!!!!!!");


Console.WriteLine("!!!!!!! Arithmetic Operators (+,-,*,/,%) !!!!!!!");

int num1 = 10;
int num2 = 40;
Console.WriteLine($"{num1} + {num2} = {num1 + num2}");
Console.WriteLine($"{num1} - {num2} = {num1 - num2}");
Console.WriteLine($"{num1} * {num2} = {num1 * num2}");
Console.WriteLine($"{num1} / {num2} = {num1 / num2}");
Console.WriteLine($"{num1} % {num2} = {num1 % num2}");

Console.WriteLine("!!!!!!! Assignment Operators (=,+=,-=,*=,/=,%=) !!!!!!!");

num1 += 30;
//num1 = num1 + 30;
Console.WriteLine($"Num1 After += 30 = {num1}");

num1 -= 20;
//num1 = num1 - 20;
Console.WriteLine($"Num1 After -= 20 = {num1}");

num1 *= 10;
//num1 = num1 * 10;
Console.WriteLine($"Num1 After *= 10 = {num1}");

num1 /= 2;
//num1 = num1 / 2;
Console.WriteLine($"Num1 After /= 2 = {num1}");


Console.WriteLine("!!!!!!! Relational Operators (== , > , < , >= , <= , != ) !!!!!!!");

int num3 = 4350;
int num4 = 4555;
Console.WriteLine("Num3 =" + num3);
Console.WriteLine("Num4 =" + num4);
Console.WriteLine($"num3 == num4 = {num3==num4}");
Console.WriteLine($"num3 > num4 = {num3 > num4}");
Console.WriteLine($"num3 < num4 = {num3 < num4}");
Console.WriteLine($"num3 >= num4 = {num3 >= num4}");
Console.WriteLine($"num3 <= num4 = {num3 <= num4}");
Console.WriteLine($"num3 != num4 = {num3 != num4}"); // True

Console.WriteLine("!!!!!!! Logical Operators (&& => AND , || => OR , ! => NOT) !!!!!!!");

bool condition1=true;
bool condition2=false;

Console.WriteLine($"Condition1 && Condition2 : {condition1 && condition2}");
Console.WriteLine($"Condition1 || Condition2 : {condition1 || condition2}");
Console.WriteLine($"!Condition1 : {!condition1}");

Console.WriteLine("!!!!!!!!!!!!!! Controll-Flow (if, else ,else if,switch, ternary operator) !!!!!!!!!!!!!!");

Console.WriteLine("!!!!!!!!!!!!!! IF : !!!!!!!!!!!!!!");

string role = "User";

if (role == "Admin")
{
    Console.WriteLine("Hello Admin");
    Console.WriteLine("You Can Read & Write any Content of Our Website");
}

Console.WriteLine("!!!!!!!!!!!!!! ELSE : !!!!!!!!!!!!!!");

if (role == "Admin")
{
    Console.WriteLine("Hello User");
    Console.WriteLine("You Can Read But Can't Write any Content of Our Website");
}
else
{
    Console.WriteLine("Hello Admin");
    Console.WriteLine("You Can Read & Write any Content of Our Website");
}


Console.WriteLine("!!!!!!!!!!!!!! ELSE IF : !!!!!!!!!!!!!!");

if (role == "Admin")
{
    Console.WriteLine("Hello Admin");
    Console.WriteLine("You Have All Access");
}
else if (role == "Shop")
{
    Console.WriteLine("Hello Shop Keeper");
    Console.WriteLine("You Can Sell & Buy");
}
else
{
    Console.WriteLine("Hello User");
    Console.WriteLine("You Can Only Buy");

}

