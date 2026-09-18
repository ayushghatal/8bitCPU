-- General Purpose Register - A B C D


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gp_reg is
    Port(
        clk: in STD_LOGIC;
        reg_sel: in STD_LOGIC_VECTOR(2 downto 0);
        write_en: in STD_LOGIC;
        data_in: in STD_LOGIC_VECTOR(7 downto 0);

        data_out: out STD_LOGIC_VECTOR(7 downto 0)
    );
end gp_reg;

architecture Behavioral of gp_reg is
    type reg_array is array (0 to 3) of STD_LOGIC_VECTOR(7 downto 0); -- 4 registers of 8 bits each
    signal registers: reg_array := (
        others => (others => '0')
    );
    begin
        process(clk)
        begin
            if rising_edge(clk) then
                if write_en = '1' then
                    registers(to_integer(unsigned(reg_sel))) <= data_in;
                end if;
            end if;
        end process;
        data_out <= registers(to_integer(unsigned(reg_sel)));
end Behavioral; 