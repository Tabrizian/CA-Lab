library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
    port(
            command : in STD_LOGIC_VECTOR(3 downto 0);
            a : in STD_LOGIC_VECTOR(15 downto 0);
            b : in STD_LOGIC_VECTOR(15 downto 0);
            res : out STD_LOGIC_VECTOR(15 downto 0)
        );
end alu;

architecture behavioral of alu is
    component and_eight is
        port(
                A : in STD_LOGIC_VECTOR(15 downto 0);
                B : in STD_LOGIC_VECTOR(15 downto 0);
                ands :out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;
    component divider_sixteen is
        port(
                a : in STD_LOGIC_VECTOR(15 downto 0);
                b : in STD_LOGIC_VECTOR(15 downto 0);
                res : out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;

    component multiplier_eight is
        port(
                A : in STD_LOGIC_VECTOR(15 downto 0);
                B : in STD_LOGIC_VECTOR(15 downto 0);
                res : out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;
    component or_sixteen is
        port(
                A : in STD_LOGIC_VECTOR(15 downto 0);
                B : in STD_LOGIC_VECTOR(15 downto 0);
                ors :out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;
    component shl_sixteen is
        port(
                a : in STD_LOGIC_VECTOR(15 downto 0);
                data_in : in STD_LOGIC;
                result:out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;
    component shr_sixteen is
        port(
                a : in STD_LOGIC_VECTOR(15 downto 0);
                data_in : in STD_LOGIC;
                result:out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;
    component ripple_sixteen_adder is
        port (
        A,B:in STD_LOGIC_VECTOR(15 downto 0);
        sum:out STD_LOGIC_VECTOR(15 downto 0);
        cout:out STD_LOGIC;
        command:in STD_LOGIC);
    end component;
    component xnor_eight is
        port(
                A : in STD_LOGIC_VECTOR(15 downto 0);
                B : in STD_LOGIC_VECTOR(15 downto 0);
                xnors :out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;
    component xor_eight is
        port(
                A : in STD_LOGIC_VECTOR(15 downto 0);
             B : in STD_LOGIC_VECTOR(15 downto 0);
             xors :out STD_LOGIC_VECTOR(15 downto 0)
         );
    end component;
    signal sums, xors, xnors, ors, ands, multiplies, dividers, shrs, shls : STD_LOGIC_VECTOR(15 downto 0);
begin
    and_er : and_eight port map(a, b, ands);
    or_er : or_sixteen port map(a, b, ors);
    xor_er : xor_eight port map(a, b, xors);
    xnor_er : xnor_eight port map(a, b, xnors);
    shr_er : shr_sixteen port map(a, '0',shrs);
    shl_er : shl_sixteen port map(a, '0',shls);
end behavioral;
