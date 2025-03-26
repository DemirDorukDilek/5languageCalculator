with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

procedure Expression_Calc is

   function Calc(Exp : String) return Float is
      Idx : Positive := Exp'First;

      procedure Ignore_Spaces is
      begin
         while Idx <= Exp'Last and then Exp(Idx) = ' ' loop
            Idx := Idx + 1;
         end loop;
      end Ignore_Spaces;

      function Expr return Float;
      function Term return Float;
      function Factor return Float;

      function Expr return Float is
         Val : Float := Term;
      begin
         loop
            Ignore_Spaces;
            exit when Idx > Exp'Last;

            case Exp(Idx) is
               when '+' =>
                  Idx := Idx + 1;
                  Val := Val + Term;
               when '-' =>
                  Idx := Idx + 1;
                  Val := Val - Term;
               when others =>
                  exit;
            end case;
         end loop;
         return Val;
      end Expr;

      function Term return Float is
         Val : Float := Factor;
         Temp : Float;
      begin
         loop
            Ignore_Spaces;
            exit when Idx > Exp'Last;

            case Exp(Idx) is
               when '*' =>
                  Idx := Idx + 1;
                  Temp := Factor;
                  Val := Val * Temp;
               when '/' =>
                  Idx := Idx + 1;
                  Temp := Factor;
                  if Temp = 0.0 then
                     raise Constraint_Error with "divide by 0 exception!";
                  end if;
                  Val := Val / Temp;
               when others =>
                  exit;
            end case;
         end loop;
         return Val;
      end Term;

      function Factor return Float is
         Start_Pos : Positive;
         Dots : Natural := 0;
      begin
         Ignore_Spaces;

         if Idx > Exp'Last then
            raise Constraint_Error with "Unexpeted end string exeption.";
         end if;

         if Exp(Idx) = '(' then
            Idx := Idx + 1;
            declare
               Val : constant Float := Expr;
            begin
               Ignore_Spaces;
               if Idx > Exp'Last or else Exp(Idx) /= ')' then
                  raise Constraint_Error with "Parentheses mismatch.";
               end if;
               Idx := Idx + 1;
               return Val;
            end;
         elsif Exp(Idx) in '0'..'9' or else Exp(Idx) = '.' then
            Start_Pos := Idx;
            while Idx <= Exp'Last and then (Exp(Idx) in '0'..'9' or Exp(Idx) = '.') loop
               if Exp(Idx) = '.' then
                  Dots := Dots + 1;
                  if Dots > 1 then
                     raise Constraint_Error with "Incorrect number exeption.";
                  end if;
               end if;
               Idx := Idx + 1;
            end loop;
            return Float'Value(Exp(Start_Pos .. Idx - 1));
         else
            raise Constraint_Error with "Invalid character: '" & Exp(Idx) & "'";
         end if;
      end Factor;

   begin
      Ignore_Spaces;
      if Idx > Exp'Last then
         raise Constraint_Error with "Expression is empty.";
      end if;

      declare
         Final_Result : constant Float := Expr;
      begin
         Ignore_Spaces;
         if Idx <= Exp'Last then
            raise Constraint_Error with "Unexpeted characters after expression.";
         end if;
         return Final_Result;
      end;
   exception
      when Err : others =>
         Raise_Exception(Constraint_Error'Identity, Exception_Message(Err));
   end Calc;

begin
   Put_Line("('q' to exit)");
   loop
      Put("> ");
      declare
         User_Input : constant String := Get_Line;
      begin
         exit when User_Input = "q";
         exit when User_Input = "";
         declare
            Answer : constant Float := Calc(User_Input);
         begin
            Put("Calculated: ");
            Put(Answer, Fore => 1, Aft => 2, Exp => 0);
            New_Line;
         exception
            when Error : others =>
               Put_Line("Hata: " & Exception_Message(Error));
         end;
      end;
   end loop;
exception
   when E : others =>
      Put_Line("Major Hata: " & Exception_Message(E));
end Expression_Calc;
