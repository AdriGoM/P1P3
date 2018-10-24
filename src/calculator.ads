package Calculator with SPARK_Mode => On is

   type naturalArray is array (Natural range 1 .. 10) of Natural;

   function multiplyArrays (v1 : naturalArray; v2 : naturalArray; length : Natural)  return naturalArray
       with
           pre =>  v1'First = 1 and
                   v2'First = 1 and
                   v1'Last = v2'Last and
                   length > 0 and
                   v1'First < v1'Last and
                   v2'First < v2'Last and
                   (for all x in v1'Range => (if v1(x) > 0 then Integer'Last/v1(x) >= v2(x))) and
                   (for all x in v2'Range => (if v2(x) > 0 then Integer'Last/v2(x) >= v1(x))),
                   post =>(for all k in multiplyArrays'Result'Range =>
                           (if v1(k) = 0 or v2(k) = 0 then
                               multiplyArrays'Result(k) = 0
                           elsif Integer'Last/v1(k) >= v2(k) and Integer'Last/v2(k) >= v1(k) then
                    	       multiplyArrays'Result(k) = v1(k)*v2(k)));

   function divideArrays (v1 : naturalArray; v2 : naturalArray; length : Natural)  return naturalArray
       with
           pre =>  v1'First = 1 and
                   v2'First = 1 and
                   v1'Last = v2'Last and
                   length > 0 and
                   v1'First < v1'Last and
                   v2'First < v2'Last and
                   (for all x in v1'Range => (v1(x) > 0)) and
                   (for all x in v2'Range => (v2(x) > 0)),
                   post =>(for all k in divideArrays'Result'Range =>
                    	       (divideArrays'Result(k) = v1(k)/v2(k)));

   function biggerNumberArrays (v1 : naturalArray; v2 : naturalArray; length : Natural)  return naturalArray
       with
           pre =>  v1'First = 1 and
                   v2'First = 1 and
                   v1'Last = v2'Last and
                   length > 0 and
                   v1'First < v1'Last and
                   v2'First < v2'Last and
                   (for all x in v1'Range => (v1(x) > 0)) and
                   (for all x in v2'Range => (v2(x) > 0)),
                   post =>(for all k in biggerNumberArrays'Result'Range =>
                    	   (if v1(k) > v2(k) then
                               biggerNumberArrays'Result(k) = v1(k)
                            else
                               biggerNumberArrays'Result(k) = v2(k)));

   function smallerNumberArrays (v1 : naturalArray; v2 : naturalArray; length : Natural)  return naturalArray
       with
           pre =>  v1'First = 1 and
                   v2'First = 1 and
                   v1'Last = v2'Last and
                   length > 0 and
                   v1'First < v1'Last and
                   v2'First < v2'Last and
                   (for all x in v1'Range => (v1(x) > 0)) and
                   (for all x in v2'Range => (v2(x) > 0)),
                   post =>(for all k in smallerNumberArrays'Result'Range =>
                    	   (if v1(k) < v2(k) then
                               smallerNumberArrays'Result(k) = v1(k)
                            else
                               smallerNumberArrays'Result(k) = v2(k)));

end Calculator;
