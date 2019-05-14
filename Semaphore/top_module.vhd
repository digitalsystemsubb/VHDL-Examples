----------------------------------------------------------------------------------
-- Company: UBB
-- Engineer: Krzysztof Herman
-- 
-- Create Date:    11:45:53 04/20/2018 
-- Semaphore controller

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- defintion of the top module 
entity top_module is
	port( rst: in  std_logic;                     -- reset signal assigned to a pushbutton
	      clk: in  std_logic;                     -- clock signal 50 MHz
			JA:  out std_logic_vector(5 downto 0)   -- output signal assigned to a pinheader JA1
	);
end top_module;

architecture Behavioral of top_module is

-- declaration of a SemaphoreCtrl component to be used
	component  SemaphoreCtrl
		port( clk: in std_logic;
				rst: in std_logic;
				R_n: out std_logic;
				O_n: out std_logic;
				G_n: out std_logic;
				R_e: out std_logic;
				O_e: out std_logic;
				G_e: out std_logic
			);
	end component;

   -- declaration of a counter signal to be used as a frequency divider 
   --  cnt(21) will generate a square wave with a frequency of 50MHZ / (2^{21})	
	signal cnt: std_logic_vector(21 downto 0);

begin

   -- insantiation of a module SemaphoreCtrl 
semaphore: SemaphoreCtrl port map ( clk => cnt(21),   -- clock  mapping 
                                    rst => rst,       -- reset  mapping 
												R_n => JA(0),     -- output mapping 
												O_n => JA(1),
												G_n => JA(2),
												R_e => JA(3),
												O_e => JA(4),
												G_e => JA(5)
												);

-- proces which defines a 21 bit wide binary counter withc asynchronous reset 
cnt_proc: process(clk, rst)
		    begin 
			 if rst = '1' then
				cnt <= (others => '0');
			 elsif rising_edge(clk) then  
           		cnt <= cnt + 1;	 
			 end if;
			  
			 end process;

end Behavioral;

