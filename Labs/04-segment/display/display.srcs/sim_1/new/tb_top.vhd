----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2021 17:52:16
-- Design Name: 
-- Module Name: tb_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

        
    -- Local signals
    signal s_SW      : std_logic_vector(4 - 1 downto 0);
    signal s_CA      : std_logic;
    signal s_CB      : std_logic;
    signal s_CC      : std_logic;
    signal s_CD      : std_logic;
    signal s_CE      : std_logic;
    signal s_CF      : std_logic;
    signal s_CG      : std_logic;
    signal s_AN      : std_logic_vector(8 - 1 downto 0);
    signal s_LED     : std_logic_vector(8 - 1 downto 0);

begin
    -- Connecting testbench signals with 7 segment display entity (Unit Under Test)
    uut_tb_top : entity work.top
        port map(
            SW           => s_SW,
            CA           => s_CA,
            CB           => s_CB,
            CC           => s_CC,
            CD           => s_CD,
            CE           => s_CE,
            CF           => s_CF,
            CG           => s_CG,
            AN           => s_AN,
            LED          => s_LED
            
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;
        
        s_SW <= "0000";  wait for 100 ns;       -- 0
        s_SW <= "0001";  wait for 100 ns;       -- 1
        s_SW <= "0010";  wait for 100 ns;       -- 2
        s_SW <= "0011";  wait for 100 ns;       -- 3
        s_SW <= "0100";  wait for 100 ns;       -- 4
        s_SW <= "0101";  wait for 100 ns;       -- 5
        s_SW <= "0110";  wait for 100 ns;       -- 6
        s_SW <= "0111";  wait for 100 ns;       -- 7
        s_SW <= "1000";  wait for 100 ns;       -- 8
        s_SW <= "1001";  wait for 100 ns;       -- 9
        s_SW <= "1010";  wait for 100 ns;       -- A
        s_SW <= "1011";  wait for 100 ns;       -- b
        s_SW <= "1100";  wait for 100 ns;       -- C
        s_SW <= "1101";  wait for 100 ns;       -- d
        s_SW <= "1110";  wait for 100 ns;       -- E
        s_SW <= "1111";  wait for 100 ns;       -- F
                
        
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
end Behavioral;
