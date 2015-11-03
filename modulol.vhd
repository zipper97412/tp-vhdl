-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity compteur_N is
	Generic (
		C_NB_BIT_COUNTER : integer := 4;
		C_MODULO : integer := 10
 	);
 	Port ( 	clk : in STD_LOGIC;
 			rst : in STD_LOGIC;
 			enable : in STD_LOGIC;
			deb : out STD_LOGIC;
 			out_count : inout STD_LOGIC_VECTOR (C_NB_BIT_COUNTER - 1 downto 0)
 	);
end compteur_N;

architecture A_compteur_N of compteur_N is
signal cnt : integer range 0 to C_MODULO;
signal debi : std_logic;
begin
	out_count <= std_logic_vector(to_unsigned(cnt,C_NB_BIT_COUNTER));
    deb <= debi;
	count:process(rst, clk)
    begin
        if rst = '1' then
            cnt <= 0;
        elsif (clk'event and clk='1') then
            if enable = '1' then
                if cnt = C_MODULO then
                    cnt <= 0;
                    debi <= '1';
                else
                    cnt <= cnt + 1;
                end if;
                if debi = '1' then
                	debi <= '0';
                end if;
            end if;
        end if;
    end process;
end architecture;
