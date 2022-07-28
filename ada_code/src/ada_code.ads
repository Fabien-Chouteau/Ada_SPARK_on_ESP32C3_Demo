with System;
with Interfaces;

package Ada_Code is

   -- API exported to the C code --

   function Generate_Page (Buffer     : System.Address;
                           Buffer_Len : Interfaces.Unsigned_32)
                           return Interfaces.Unsigned_32;
   pragma Export (C, Generate_Page, "generate_page");

   -- API imported from C code --

   type LED_Color is (Off, Red, Green, Blue);
   for LED_Color use (Off => 0, Red => 1, Green => 2, Blue => 3);

   procedure Set_LED_Color (Color : LED_Color);
   pragma Import (C, Set_LED_Color, "set_led_color");

end Ada_Code;
