package body Calculator with SPARK_Mode => On is

   function octalToDecimal (Octal :octalArray) return Natural is
      result : Natural := 0;
      n : Natural := 0;
   begin
      for i in reverse Octal'Range loop
         result := result + Octal(i) * 8 ** n;
         n := n +1;
      end loop;

      return result;
   end octalToDecimal;

   function decimalToOctal (Decimal : Natural) return octalArray is
      resultArray : octalArray (1 .. 32);
      rest : Integer;
   begin
      rest := Decimal;
      for counter in reverse 1 .. 32 loop
         resultArray(counter) := (rest rem 8);
         rest := rest / 8;
      end loop;
      return resultArray;
   end decimalToOctal;

   function binaryToDecimal (Binary : booleanArray) return Natural is
      result : Integer := 0;
      index : Natural;
   begin
      index := 1;
       if Binary(32) then
         result := 1;
      end if;

       for counter in reverse 1 .. 31 loop
          if Binary(counter) then
            result := result + 2 ** index;
         end if;
         index := index + 1;
       end loop;
       return result;
   end binaryToDecimal;

   function decimalToBinary (Decimal : Natural) return booleanArray is
      resultArray : booleanArray (1 .. 32);
      rest : Natural;
   begin
      rest := Decimal;
      for counter in reverse 1 .. 32 loop
         if (rest rem 2) = 1 then
            resultArray(counter) := True;
         else
            resultArray(counter) := False;
         end if;
         rest := rest / 2;
      end loop;
      return resultArray;
   end decimalToBinary;

end Calculator;
