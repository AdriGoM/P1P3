package body Calculator with SPARK_Mode => On is

    function multiplyArrays (v1 : naturalArray; v2 : naturalArray; length : Natural)  return naturalArray is
        result : naturalArray := v1;
        index : Natural := v1'First;
    begin
        while index <= v1'Last loop
            result(index) := v1(index)*v2(index);
            index := index + 1;
         pragma Loop_Invariant (index in v1'First .. v1'Last+1);

            --pragma Loop_Invariant (v1'First = result'First and v2'First = result'First and v1'First = v2'First);
            --pragma Loop_Invariant (v1'Last = result'Last and v2'Last = result'Last and v1'Last = v2'Last);
            pragma Loop_Invariant (for all k in v1'First .. index-1 => (if v1(k) = 0 or v2(k) = 0 then result(k) = 0 else result(k) = v1(k)*v2(k)));
        end loop;
        return result;
    end multiplyArrays;

    function divideArrays (v1 : naturalArray; v2 : naturalArray; length : Natural)  return naturalArray is
        result : naturalArray := v1;
        index : Natural := v1'First;
    begin
        while index <= v1'Last loop
            result(index) := v1(index)/v2(index);
            index := index + 1;
         pragma Loop_Invariant (index in v1'First .. v1'Last+1);

            --pragma Loop_Invariant (v1'First = result'First and v2'First = result'First and v1'First = v2'First);
            --pragma Loop_Invariant (v1'Last = result'Last and v2'Last = result'Last and v1'Last = v2'Last);
            pragma Loop_Invariant (for all k in v1'First .. index-1 => (result(k) = v1(k)/v2(k)));
        end loop;
        return result;
    end divideArrays;

    function biggerNumberArrays (v1 : naturalArray; v2 : naturalArray; length : Natural)  return naturalArray is
        result : naturalArray := v1;
        index : Natural := v1'First;
    begin
        while index <= v1'Last loop
            if v1(index) > v2(index) then
                result(index) := v1(index);
            else
                result(index) := v2(index);
            end if;
            index := index + 1;
            pragma Loop_Invariant (index in v1'First .. v1'Last+1);
            pragma Loop_Invariant (v1'First = result'First and v2'First = result'First and v1'First = v2'First);
            pragma Loop_Invariant (v1'Last = result'Last and v2'Last = result'Last and v1'Last = v2'Last);
            pragma Loop_Invariant (for all k in v1'First .. index-1 => (if v1(k) > v2(k) then result(k) = v1(k) else result(k) = v2(k)));
        end loop;
        return result;
    end biggerNumberArrays;

    function smallerNumberArrays (v1 : naturalArray; v2 : naturalArray; length : Natural)  return naturalArray is
        result : naturalArray := v1;
        index : Natural := v1'First;
    begin
        while index <= v1'Last loop
            if v1(index) < v2(index) then
                result(index) := v1(index);
            else
                result(index) := v2(index);
            end if;
            index := index + 1;
            pragma Loop_Invariant (index in v1'First .. v1'Last+1);
            pragma Loop_Invariant (v1'First = result'First and v2'First = result'First and v1'First = v2'First);
            pragma Loop_Invariant (v1'Last = result'Last and v2'Last = result'Last and v1'Last = v2'Last);
            pragma Loop_Invariant (for all k in v1'First .. index-1 => (if v1(k) < v2(k) then result(k) = v1(k) else result(k) = v2(k)));
        end loop;
        return result;
    end smallerNumberArrays;

end Calculator;
