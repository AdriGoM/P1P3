--  Anade mas tests para comprobar todas las combinaciones de
--  operadores positivos, negativos y el cero.

with Ada.Text_IO;     use Ada.Text_IO;
with Test_Assertions; use Test_Assertions;
with Calculator;      use Calculator;

procedure Test_Calculator is

      procedure Test_1 is
      Msg   : constant String := "Test_1: Decimal to binary";
      prueba : booleanArray(1..32);
      prueba1 : booleanArray(1..32);
      prueba2 : booleanArray(1..32);
   begin
      prueba := (false,false,false,false,false,false,false,false,false,false,
                 false,false,false,false,false,false,
                 false,false,false,false,false,false,false,false,false,false,
                 false,false,true,false,false,true);
      prueba1 := (false,false,false,false,false,false,false,false,false,false,
                 false,false,false,false,false,false,
                 false,false,false,false,false,false,false,true,false,true,
                  false,false,false,false,false,false);
      prueba2 := (false,false,false,false,false,false,false,false,false,false,
                 false,false,false,false,false,false,
                 false,false,false,false,false,false,true,false,false,false,
                 false,false,false,false,false,false);
      Assert_True (decimalToBinary (9) = prueba, Msg);
      Assert_True (decimalToBinary (320) = prueba1, Msg);
      Assert_True (decimalToBinary (512) = prueba2, Msg);
   exception
      when Test_Assertion_Error=>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_1;

   procedure Test_2 is
      Msg   : constant String := "Test_2: Binary to decimal";
      prueba : booleanArray(1..32);
      prueba1 : booleanArray(1..32);
      prueba2 : booleanArray(1..32);
   begin
      prueba := (false,false,false,false,false,false,false,false,false,false,
                 false,false,false,false,false,false,
                 false,false,false,false,false,false,false,false,false,false,
                 false,false,true,false,true,false);
      prueba1 := (false,false,false,false,false,false,false,false,false,false,
                 false,false,false,false,false,false,
                 false,false,false,false,false,false,false,true,false,true,
                  false,false,false,false,false,true);
      prueba2 := (false,false,false,false,false,false,false,false,false,false,
                 false,false,false,false,false,false,
                 false,false,false,false,false,false,true,false,false,false,
                 false,false,false,false,false,true);
     Assert_True (binaryToDecimal (prueba) = 10, Msg);
     Assert_True (binaryToDecimal (prueba1) = 321, Msg);
      Assert_True (binaryToDecimal (prueba2) = 513 , Msg);
   exception
      when Test_Assertion_Error=>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_2;

      procedure Test_3 is
      Msg   : constant String := "Test_3: Decimal to octal";
      prueba : octalArray(1 .. 32);
      prueba1 : octalArray(1 .. 32);
      prueba2 : octalArray(1 .. 32);
   begin
      prueba := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2);
      prueba1 := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,7,2);
      prueba2 := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0);

      Assert_True (decimalToOctal(10) = prueba, Msg);
      Assert_True (decimalToOctal (122) = prueba1, Msg);
      Assert_True (decimalToOctal (1024) = prueba2, Msg);
   exception
      when Test_Assertion_Error=>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_3;

   procedure Test_4 is
      Msg   : constant String := "Test_4: Octal to decimal";
      prueba : octalArray(1 .. 2);
      prueba1 : octalArray(1 .. 3);
      prueba2 : octalArray(1 .. 4);
      prueba3 : octalArray(1 .. 10);
      --prueba4 : octalArray(1 .. 3);
      --prueba5 := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2);
   begin
      prueba := (1,0);
      prueba1 := (1,7,2);
      prueba2 := (2,0,0,0);
      prueba3 := (2,3,4,5,6,7,7,4,1,2);
     --prueba4 := (8,8,8);

      Assert_True (octalToDecimal(prueba) = 8, Msg);
      Assert_True (octalToDecimal(prueba1) = 122, Msg);
      Assert_True (octalToDecimal(prueba2) = 1024, Msg);
      Assert_True (octalToDecimal(prueba3) = 328695562, Msg);
      --Assert_True (octalToDecimal(prueba4) = , Msg);
   exception
      when Test_Assertion_Error=>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
         raise;
   end Test_4;

begin
   Put_Line ("********************* Test_Calculator");
   Test_1;
   Test_2;
   Test_3;
   Test_4;
end Test_Calculator;
