------------------------------------------------------------------------
--
-- Testbench for 7 segment display.
-- EDA Playground
--
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_hex_7seg is
    -- Entity of testbench is always empty
end entity tb_hex_7seg;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_hex_7seg is

    -- Local signals
    signal s_hex     : std_logic_vector(4 - 1 downto 0);
    signal s_seg     : std_logic_vector(7 - 1 downto 0);

begin
    -- Connecting testbench signals with 7 segment display entity (Unit Under Test)
    uut_tb_hex_7seg : entity work.hex_7seg
        port map(
            hex_i           => s_hex,
            seg_o           => s_seg
            
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;
        
        s_hex <= "0000";  wait for 100 ns;       -- 0
        s_hex <= "0001";  wait for 100 ns;       -- 1
        s_hex <= "0010";  wait for 100 ns;       -- 2
        s_hex <= "0011";  wait for 100 ns;       -- 3
        s_hex <= "0100";  wait for 100 ns;       -- 4
        s_hex <= "0101";  wait for 100 ns;       -- 5
        s_hex <= "0110";  wait for 100 ns;       -- 6
        s_hex <= "0111";  wait for 100 ns;       -- 7
        s_hex <= "1000";  wait for 100 ns;       -- 8
        s_hex <= "1001";  wait for 100 ns;       -- 9
        s_hex <= "1010";  wait for 100 ns;       -- A
        s_hex <= "1011";  wait for 100 ns;       -- b
        s_hex <= "1100";  wait for 100 ns;       -- C
        s_hex <= "1101";  wait for 100 ns;       -- d
        s_hex <= "1110";  wait for 100 ns;       -- E
        s_hex <= "1111";  wait for 100 ns;       -- F
                
        
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;