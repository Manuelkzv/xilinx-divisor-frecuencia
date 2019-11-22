
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

entity principal is
    Port ( 
		s7 : out  STD_LOGIC_VECTOR (6 downto 0);
		led1 : out STD_LOGIC;
		led2 : out STD_LOGIC;
		clk_in : in STD_LOGIC;
		num : in std_logic_vector (0 to 3));
end principal;

architecture Behavioral of principal is

	component divisorFrec is
	Port ( clk : in  STD_LOGIC;
          clk_1s : out  STD_LOGIC;
          clk_500ms : out  STD_LOGIC);
	end component;
begin

	u1: divisorFrec port map(
		clk       => clk_in,
		clk_1s    => led1,
		clk_500ms => led2
	);
	d7s: process(num)
	begin
		case num is
			when "0000" =>
				s7 <= "0000001";
			when "0001" =>
				s7 <= "1001111";
			when "0010" =>
				s7 <= "0010010";
			when "0011" =>
				s7 <= "0000110";
			when "0100" =>
				s7 <= "1001100";
			when "0101" =>
				s7 <= "0100101";
			when "0110" =>
				s7 <= "1100000";
			when "0111" =>
				s7 <= "0001111";
			when "1000" =>
				s7 <= "0000000";
			when "1001" =>
				s7 <= "0001100";
			when others =>
				s7 <= "1111110";
		end case;
	end process;
end Behavioral;

