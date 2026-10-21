using System;
class CoolClass {
    public void PrintNum(int x) => Console.WriteLine($"Int: {x}");
    public void PrintNum(double x) => Console.WriteLine($"Double: {x}");
    public virtual void PrintClassName() => Console.WriteLine($"Class: CoolClass");
}

class CoolChild : CoolClass {
    public override void PrintClassName() => Console.WriteLine($"Class: CoolChild");
}

class Program {
    public static void Main() {
        Console.WriteLine("Static binding (overloading)");
        Console.WriteLine();
        
        CoolClass parent = new CoolClass();
        parent.PrintNum(1337);
        parent.PrintNum(133.7);
        
        Console.WriteLine();
        Console.WriteLine("Dynamic binding (overriding)");
        Console.WriteLine();

        CoolChild child1 = new CoolChild();
        CoolChild child2 = new CoolChild();

        CoolClass[] arr = { parent, child1, child2 };
        foreach (CoolClass item in arr) {
            item.PrintClassName();
        }
    }
}
