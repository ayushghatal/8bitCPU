library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port(
        count_en: in STD_LOGIC;
        clk: in STD_LOGIC;
        reset: in STD_LOGIC;

        count: out STD_LOGIC_VECTOR(7 downto 0)
    );
end PC;

architecture Behavioral of PC is
    begin
        on rising_edge(clk) process(clk, reset)
        begin
            if reset = '1' then
                count <= (others => '0');
            elsif count_en = '1' then
                count <= std_logic_vector(unsigned(count) + 1);
            end if;
        end process;
end Behavioral;