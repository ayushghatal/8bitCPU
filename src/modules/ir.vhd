library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR is
    Port(
        clk: in STD_LOGIC;
        load: in STD_LOGIC;
        data_in: in STD_LOGIC_VECTOR(7 downto 0);

        data_out: out STD_LOGIC_VECTOR(7 downto 0)
    );
end IR;

architecture Behavioral of IR is
    signal instruction: STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    begin
        process(clk)
        begin
            if rising_edge(clk) then
                if load = '1' then
                    instruction <= data_in;
                end if;
            end if;
        end process;
        data_out <= instruction;
end Behavioral;