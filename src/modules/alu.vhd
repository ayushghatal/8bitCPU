library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        A: in STD_LOGIC_VECTOR(7 downto 0);
        B: in STD_LOGIC_VECTOR(7 downto 0);
        Sel: in STD_LOGIC_VECTOR(1 downto 0);
        
        Output: out STD_LOGIC_VECTOR(7 downto 0);
        Carry: out STD_LOGIC;
        Zero: out STD_LOGIC
    );
end ALU;

architecture Behavioral of ALU is
    signal temp: STD_LOGIC_VECTOR(8 downto 0); -- 9 bits to accommodate carry
begin
    with Sel select
        temp <= std_logic_vector(("0" & unsigned(A)) + ("0" & unsigned(B))) when "00",
                std_logic_vector(("0" & unsigned(A)) - ("0" & unsigned(B))) when "01",
                "0" & (A and B) when "10",
                "0" & (A or B) when others;
    Output <= temp(7 downto 0);
    Carry <= temp(8);
    Zero <= '1' when temp(7 downto 0) = "00000000" else '0';
end Behavioral;    