LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;
use ieee.numeric_std.all;
 

 
ENTITY tb_filterPARALLEL IS
END tb_filterPARALLEL;
 
ARCHITECTURE behavior OF tb_filterPARALLEL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT filterPARALLEL
    PORT(
         clk : IN  std_logic;
         clk_enable : IN  std_logic;
         reset : IN  std_logic;
         filter_in : IN  signed(7 downto 0);
         filter_out : OUT  signed(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clk_enable : std_logic := '0';
   signal reset : std_logic := '0';
   signal filter_in : signed(7 downto 0) := x"00";

 	--Outputs
   signal filter_out : signed(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: filterPARALLEL PORT MAP (
          clk => clk,
          clk_enable => clk_enable,
          reset => reset,
          filter_in => filter_in,
          filter_out => filter_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		reset <= '1';
		wait for 15 ns;	
		reset <= '0';
		clk_enable <= '1';

      wait for clk_period;
		filter_in <= x"02";
		wait for clk_period;
		filter_in <= x"03";
		wait for clk_period;
		filter_in <= x"05";
		wait for clk_period;
		filter_in <= x"04";
		wait for clk_period;
		filter_in <= x"06";
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
