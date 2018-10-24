--  Anade mas tests para comprobar todas las combinaciones de
--  operadores positivos, negativos y el cero.

with Ada.Text_IO;     use Ada.Text_IO;
with Test_Assertions; use Test_Assertions;
with Calculator;      use Calculator;

procedure Test_Calculator is
   procedure Test_1 is
      Msg   : constant String := "Test_1: Multiply arrays";
      prueba : naturalArray;
      prueba1 : naturalArray;
      prueba2 : naturalArray;
      result1 : naturalArray;
      result2 : naturalArray;
      result3 : naturalArray;

   begin
      prueba := (1,2,3,4,5,6,7,8,9,10);
      prueba1 := (2,1,3,5,4,7,6,8,9,1);
      prueba2 := (9,1,2,8,3,7,4,5,6,1);

      result1 := (2,2,9,20,20,42,42,64,81,10);
      result2 := (9,2,6,32,15,42,28,40,54,10);
      result3 := (18,1,6,40,12,49,24,40,54,1);

      Assert_True(multiplyArrays(prueba, prueba1,10) = result1 ,Msg);
      Assert_True(multiplyArrays(prueba, prueba2,10) = result2 ,Msg);
      Assert_True(multiplyArrays(prueba1, prueba2,10) = result3 ,Msg);

   exception
      when Test_Assertion_Error=>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_1;

   procedure Test_2 is
      Msg   : constant String := "Test_2: Divide arrays";
      prueba : naturalArray;
      prueba1 : naturalArray;
      prueba2 : naturalArray;
      prueba3 : naturalArray;
      prueba4 : naturalArray;
      result1 : naturalArray;
      result2 : naturalArray;
      result3 : naturalArray;

   begin
      prueba := (2,6,20,50,30,12,54,8,9,10);
      prueba1 :=(2,2,4,2,3,4,6,2,9,1);
      prueba2 := (1,6,1,25,15,6,2,1,1,10);
      prueba3 := (90,21,25,32,36,6,64,28,1,18);
      prueba4 := (3,3,1,8,6,6,4,7,1,9);


      result1 := (1,3,5,25,10,3,9,4,1,10);
      result2 := (2,1,20,2,2,2,27,8,9,1);
      result3 := (30,7,25,4,6,1,16,4,1,2);

      Assert_True(divideArrays(prueba, prueba1,10) = result1 ,Msg);
      Assert_True(divideArrays(prueba, prueba2,10) = result2 ,Msg);
      Assert_True(divideArrays(prueba3, prueba4,10) = result3 ,Msg);

   exception
      when Test_Assertion_Error=>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_2;

   procedure Test_3 is
      Msg   : constant String := "Test_3: Bigger number arrays";
      prueba : naturalArray;
      prueba1 : naturalArray;
      prueba2 : naturalArray;
      prueba3 : naturalArray;
      prueba4 : naturalArray;
      result1 : naturalArray;
      result2 : naturalArray;
      result3 : naturalArray;

   begin
      prueba := (2,6,20,50,30,12,54,8,9,10);
      prueba1 :=(2,2,4,2,3,4,6,2,9,1);
      prueba2 := (15,6,1,51,15,14,2,1,19,10);
      prueba3 := (90,21,25,32,36,6,64,28,1,18);
      prueba4 := (92,3,1,8,6,6,4,31,1,20);


      result1 := (2,6,20,50,30,12,54,8,9,10);
      result2 := (15,6,20,51,30,14,54,8,19,10);
      result3 := (92,21,25,32,36,6,64,31,1,20);

      Assert_True(biggerNumberArrays(prueba, prueba1,10) = result1 ,Msg);
      Assert_True(biggerNumberArrays(prueba, prueba2,10) = result2 ,Msg);
      Assert_True(biggerNumberArrays(prueba3, prueba4,10) = result3 ,Msg);

   exception
      when Test_Assertion_Error=>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_3;

   procedure Test_4 is
      Msg   : constant String := "Test_4: Smaller number arrays";
      prueba : naturalArray;
      prueba1 : naturalArray;
      prueba2 : naturalArray;
      prueba3 : naturalArray;
      prueba4 : naturalArray;
      result1 : naturalArray;
      result2 : naturalArray;
      result3 : naturalArray;

   begin
      prueba := (2,6,20,50,30,12,54,8,9,10);
      prueba1 :=(2,2,4,2,3,4,6,2,9,1);
      prueba2 := (15,6,1,51,15,14,2,1,19,10);
      prueba3 := (90,21,25,32,36,6,64,28,1,18);
      prueba4 := (92,3,1,8,6,6,4,31,1,20);


      result1 := (2,2,4,2,3,4,6,2,9,1);
      result2 := (2,6,1,50,15,12,2,1,9,10);
      result3 := (90,3,1,8,6,6,4,28,1,18);

      Assert_True(smallerNumberArrays(prueba, prueba1,10) = result1 ,Msg);
      Assert_True(smallerNumberArrays(prueba, prueba2,10) = result2 ,Msg);
      Assert_True(smallerNumberArrays(prueba3, prueba4,10) = result3 ,Msg);

   exception
      when Test_Assertion_Error=>
         Put_Line (Msg & " Failed (assertion)");
      when others =>
         Put_Line (Msg & " Failed (exception)");
   end Test_4;

begin
   Put_Line ("********************* Test_Calculator");
   Test_1;
   Test_2;
   Test_3;
   Test_4;
end Test_Calculator;
