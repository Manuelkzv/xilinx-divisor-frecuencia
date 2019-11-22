
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divisorFrec is
    Port ( clk : in  STD_LOGIC;
           clk_1s : out  STD_LOGIC;
           clk_500ms : out  STD_LOGIC);
end divisorFrec;

architecture Behavioral of divisorFrec is
	signal contador1s : integer range 0 to 49999999 := 0;
	signal contador500ms : integer range 0 to 24999999 := 0;
	signal bandera1   : std_logic := '0';
	signal bandera500 : std_logic := '0';
begin

	dFrec1s: process (clk)
	begin
		if rising_edge(clk)
		then
			if(contador1s = 50000000)
			then
				bandera1 <= not(bandera1);
				contador1s <= 0;
			else
				contador1s <= contador1s + 1;
			end if;
		end if;
	end process;
	
	dFrec500ms: process (clk)
	begin
		if rising_edge(clk)
		then
			if(contador500ms = 25000000)
			then 
				bandera500 <= not(bandera500);
				contador500ms <= 0;
			else
				contador500ms <= contador500ms + 1;
			end if;
		end if;
	end process;
	
	clk_1s <= bandera1;
	clk_500ms <= bandera500;
	
end Behavioral;

