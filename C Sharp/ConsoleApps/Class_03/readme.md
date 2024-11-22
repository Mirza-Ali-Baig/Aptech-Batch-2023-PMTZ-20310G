# 📘 **Class 03: Control Flow in C#**

---

## 🗂️ **Topics**
1. **Switch Statements**
2. **Ternary Operators**
3. **Loops**
   - For Loop
   - While Loop
   - Do-While Loop
   - Foreach Loop
4. **Loop Control Statements**
   - Break
   - Continue

---

## 🌟 **Overview**
This class introduced fundamental concepts for controlling the flow of a C# program. You learned how to:
- Use **switch** statements for decision-making.
- Simplify conditional logic with the **ternary operator**.
- Use **loops** (for, while, do-while, foreach) to execute repetitive tasks.
- Use **loop control statements** like break and continue for fine-grained control of iterations.

---

## ✨ **Class Highlights**

### **Student Grade System**
We implemented a student grade system that calculates a student's **grade** based on their percentage and provides relevant **remarks** using the `switch` statement.

### **Ternary Operator**
Introduced the ternary operator as a concise alternative to the `if-else` statement.

### **Loops**
- **For Loop**: Used for counting iterations.
- **While Loop**: Repeats code while a condition is true.
- **Do-While Loop**: Guarantees the block is executed at least once.
- **Foreach Loop**: Iterates over collections like arrays.

### **Control Statements**
- **Break**: Exits a loop early.
- **Continue**: Skips the current iteration and moves to the next.

---

## 📚 **Code Snippets**

### **Student Grade System**
```csharp
string studentName = "Yasir";
int urduMarks = 70, englishMarks = 50, mathsMarks = 70, physicsMarks = 80, computerMarks = 40;
decimal totalMarks = 500;
decimal obtainedMarks = urduMarks + englishMarks + mathsMarks + physicsMarks + computerMarks;

decimal percentage = obtainedMarks / totalMarks * 100;
string grade = "";

if (percentage >= 80) grade = "A+";
else if (percentage >= 70) grade = "A";
else if (percentage >= 60) grade = "B";
else if (percentage >= 50) grade = "C";
else if (percentage >= 40) grade = "D";
else grade = "Fail";

Console.WriteLine($"Student Name: {studentName}");
Console.WriteLine($"Percentage: {percentage}");
Console.WriteLine($"Grade: {grade}");

switch (grade)
{
    case "A+": Console.WriteLine("Very Good Performance"); break;
    case "A": Console.WriteLine("Good Performance"); break;
    case "B": Console.WriteLine("Good"); break;
    case "C": Console.WriteLine("Bad Performance"); break;
    case "D": Console.WriteLine("Need Improvement"); break;
    default: Console.WriteLine("Better Luck Next Time"); break;
}
```

---

### **Ternary Operator**
```csharp
bool isLoggedIn = true;
Console.WriteLine(isLoggedIn ? "You Can Access Admin Panel" : "You Can't Access Admin Panel");

int age = 10;
Console.WriteLine(age > 18 ? "You Can Vote" : "You Can't Vote");
```

---

### **For Loop Example**
```csharp
for (int i = 0; i < 10; i++)
{
    Console.WriteLine($"Loop iteration: {i}");
}
```

---

## 🏁 **Conclusion**
Control flow structures are essential for building logical and dynamic programs. This class covered foundational tools for decision-making and repetition in C#. Mastering these concepts will enable you to write more efficient and functional programs. **Next Steps:** Explore nested loops and advanced control flow mechanisms.