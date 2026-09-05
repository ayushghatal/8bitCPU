library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prog_rom is
    Port(
        addr: in STD_LOGIC_VECTOR(7 downto 0);
        data: out STD_LOGIC_VECTOR(7 downto 0)
    );
end prog_rom;

architecture Behavioral of prog_rom is
    type memory_array is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
    constant ROM: memory_array := (
        -- Initialize the ROM with your program instructions here
        others => (others => '0')
    );
    begin
       data <= ROM(to_integer(unsigned(addr)));
end Behavioral;