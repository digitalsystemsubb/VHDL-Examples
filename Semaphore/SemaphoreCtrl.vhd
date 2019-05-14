-- Designer: Krzysztof Herman
-- Date: 14.04.2018
-- Semaphore controller module
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
 

ENTITY SemaphoreCtrl IS
	port( clk: in std_logic;
	      rst: in std_logic;
	      R_n: out std_logic;
	      O_n: out std_logic;
	      G_n: out std_logic;
	      R_e: out std_logic;
	      O_e: out std_logic;
	      G_e: out std_logic
		);

END SemaphoreCtrl;
 
ARCHITECTURE behavior OF SemaphoreCtrl IS 

   -- State variable 
   signal state : std_logic_vector(1 downto 0) := (others => '0');
   -- counter logic
   signal we :  std_logic;
   signal we1 : std_logic;
   signal we2 : std_logic;
   signal cnt: std_logic_vector (5 downto 0):=(others => '0');
 
BEGIN
	-- finite state machine 
	fsm_proc:  process (clk, rst, we)
	    begin
		if rst = '1' then 
		      state <= (others => '0');
		elsif rising_edge(clk) and we = '1' then
		      state <= state + 1;
		end if;
	   end process;
	-- clock dependent counter 
	counter_proc:   process (clk, rst)
	    begin
		if rst = '1' then 
		      cnt <= (others => '0');
		elsif rising_edge(clk) then
		      cnt <= cnt + 1;
		end if;
	    end process;
  
	-- partial signals of State Register Write Enable
	we1 <= cnt(0) and cnt(1) and cnt(2) and cnt(3) and cnt(4) and cnt(5); 
	we2 <= cnt(0) and cnt(1) and cnt(2); 
	-- State register Write Enable logic 
	with state(0) select we <= we1 when '0', we2 when others;

	-- Output Logic 
	R_n <= not state(1);
	O_n <= state(0);
	G_n <= (not state(0)) and state(1);

	R_e <= state(1);
	O_e <= state(0);
	G_e <= (not state(0)) and (not state(1));

END;
