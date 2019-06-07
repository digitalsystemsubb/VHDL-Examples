---------------------------------------------------------------
-- FIR filter example based on Logisim Simulation
---------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;
use ieee.numeric_std.all;

ENTITY filterPARALLEL IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         filter_in                       :   IN    signed(7  downto 0); 
         filter_out                      :   OUT   signed(15  downto 0)  
         );
END filterPARALLEL;


----------------------------------------------------------------
--Module Architecture: filterPARALLEL
----------------------------------------------------------------
ARCHITECTURE rtl OF filterPARALLEL IS

  -- Type Definitions
  type signal_buffer_type      is array (0 to 3) of signed(7  downto 0);
  -- Constants
  CONSTANT coeff1                         : signed(7  downto 0) := x"FF";
  CONSTANT coeff2                         : signed(7  downto 0) := x"02";
  CONSTANT coeff3                         : signed(7  downto 0) := x"03";
  CONSTANT coeff4                         : signed(7  downto 0) := x"04";

  -- Signals
  SIGNAL signal_buffer                    : signal_buffer_type; 
  SIGNAL product4                         : signed(15  downto 0) := x"0000";
  SIGNAL product3                         : signed(15  downto 0) := x"0000";
  SIGNAL product2                         : signed(15  downto 0) := x"0000";
  SIGNAL product1                         : signed(15  downto 0) := x"0000";
  SIGNAL sum1                             : signed(15  downto 0) := x"0000";
  SIGNAL sum2                             : signed(15  downto 0) := x"0000";
  SIGNAL sum3                             : signed(15  downto 0) := x"0000";
  SIGNAL output_register                  : signed(15  downto 0) := x"0000";


BEGIN

  -- Block Statements
  ShiftRegisterProcess : PROCESS (clk, reset)
								  BEGIN
									 IF reset = '1' THEN
										signal_buffer(0) <= x"00";
										signal_buffer(1) <= x"00";
										signal_buffer(2) <= x"00";
										signal_buffer(3) <= x"00";
									 ELSIF clk'event AND clk = '1' THEN
										IF clk_enable = '1' THEN
											signal_buffer(0) <= filter_in;
											signal_buffer(1 TO 3) <= signal_buffer(0 TO 2);
										END IF;
									 END IF; 
								  END PROCESS ShiftRegisterProcess ;

--  products h(k)x(n-k)
  product4 <= signal_buffer(3) * coeff4;

  product3 <= signal_buffer(2) * coeff3;

  product2 <= signal_buffer(1) * coeff2;

  product1 <= signal_buffer(0) * coeff1;
--  sums of products
  sum1 <= product1 + product2;

  sum2 <= product4 + product3;

  sum3 <= sum1 + sum2; 


  Output_Register_process : PROCESS (clk, reset)
									  BEGIN
										 IF reset = '1' THEN
											output_register <=  x"0000";
										 ELSIF clk'event AND clk = '1' THEN
											IF clk_enable = '1' THEN
											  output_register <= sum3;
											END IF;
										 END IF; 
									  END PROCESS Output_Register_process;

  -- Assignment Statements
  filter_out <= output_register;
  
END rtl;
