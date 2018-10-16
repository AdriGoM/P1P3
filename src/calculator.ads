package Calculator with SPARK_Mode => On is

   type booleanArray is array (Natural range <>) of Boolean;
   type octalArray is array (Natural range <>) of Natural;

   function binaryToDecimal (Binary : booleanArray) return Natural;
   function decimalToBinary (Decimal : Natural) return booleanArray;
   function octalToDecimal (Octal : octalArray) return Natural
     --with pre => true,
     --post => (octalToDecimal'Result <= 2**64);
   function decimalToOctal (Decimal : Natural) return octalArray;

end Calculator;
