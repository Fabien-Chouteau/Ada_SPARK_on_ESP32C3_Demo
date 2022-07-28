package body Ada_Code is

   subtype Valid_Color is LED_Color range Red .. Blue;
   function Image (Color : Valid_Color) return String;

   Next_Color : Valid_Color := Valid_Color'First;

   --  Sec_Stack : aliased System.Secondary_Stack.SS_Stack (1024);
   --  Thread_Sec_Stack : System.Secondary_Stack.SS_Stack_Ptr := null;

   -----------
   -- Image --
   -----------

   function Image (Color : Valid_Color) return String
   is (case Color is
      when Red   => "<span style=""color:red;"">red</span>",
      when Green => "<span style=""color:green;"">green</span>",
      when Blue  => "<span style=""color:blue;"">blue</span>");

   -------------------
   -- Generate_Page --
   -------------------

   function Generate_Page (Buffer     : System.Address;
                           Buffer_Len : Interfaces.Unsigned_32)
                           return Interfaces.Unsigned_32
   is
      Str : String (1 .. Integer (Buffer_Len))
        with Address => Buffer;

      Messsage : constant String := "<!DOCTYPE html>" & ASCII.LF &
        "<html>" & ASCII.LF &
        "<body>" & ASCII.LF &
        "<p>Hello from Ada! The LED is now " &
        Image (Next_Color) & ".</p>" & ASCII.LF &
        "</body>" & ASCII.LF &
        "</html>" & ASCII.LF &
        ASCII.NUL;
   begin

      if Messsage'Length < Str'Length then

         Str (1 .. Messsage'Length) := Messsage;

         Set_LED_Color (Next_Color);

         if Next_Color = Valid_Color'Last then
            Next_Color := Valid_Color'First;
         else
            Next_Color := Valid_Color'Succ (Next_Color);
         end if;

         return Messsage'Length;
      else
         return 0;
      end if;
   end Generate_Page;

end Ada_Code;
