
import 'dart:io';

class Calculator{
  void Num(int a,int b,int d){
    if(d==1){
      int c=a+b;
      print('sum = $c');
    }
  }
}
class Multiplication extends Calculator{
  void Num1(int a, int b,int d){
    if(d==2){
      int c=a*b;
      print('Multiplication = $c');
    }
  }
}
class Division extends Multiplication{
  void Num2(int a,int b,int d){
    if(d==3){
      double c=(a/b);
      print('Division = $c');
    }
  }
}
class Subtraction extends Division{
  void Num3(int a,int b,int d){
    if(d==4){
      int c=a-b;
      print('Subtract = $c');
    }
  }
}
void main(){
  int x,y,d;
  print('Enter first number');
  x=int.parse(stdin.readLineSync()!);
  print('Enter second number');
  y=int.parse(stdin.readLineSync()!);
  print('Choose Your option');
  d=int.parse(stdin.readLineSync()!);
  Subtraction z = new Subtraction();
  z.Num(x, y,d);
  z.Num1(x, y,d);
  z.Num2(x, y,d);
  z.Num3(x, y,d);

}
