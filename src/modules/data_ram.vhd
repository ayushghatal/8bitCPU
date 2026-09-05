library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data_ram is
    Port(
        clk: in STD_LOGIC;
        write_en: in STD_LOGIC;
        addr: in STD_LOGIC_VECTOR(7 downto 0);
        data_in: in STD_LOGIC_VECTOR(7 downto 0);
        data_out: out STD_LOGIC_VECTOR(7 downto 0)
    );
end data_ram;

architecture Behavioral of data_ram is
    type memory_array is array (0 to 256) of STD_LOGIC_VECTOR(7 downto 0);
    signal RAM: memory_array := (
        others => (others => '0')
    );
    begin
        process(clk)
        begin
            if rising_edge(clk) then
                if write_en = '1' then
                    RAM(to_integer(unsigned(addr))) <= data_in;
                end if;
            end if;
        end process;
        data_out <= RAM(to_integer(unsigned(addr)));
end Behavioral;