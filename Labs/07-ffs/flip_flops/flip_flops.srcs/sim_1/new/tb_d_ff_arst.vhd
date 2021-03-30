----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2021 11:24:30
-- Design Name: 
-- Module Name: tb_d_ff_arst - Behavioral
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

entity tb_d_ff_arst is
--  Port ( );
end tb_d_ff_arst;

architecture Behavioral of tb_d_ff_arst is

    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    signal s_clk   : std_logic;
    signal s_arst  : std_logic;
    signal s_d     : std_logic;
    signal s_q     : std_logic;
    signal s_q_bar : std_logic;
    
begin

    uut_d_ff_arst : entity work.d_ff_arst
        port map(
            clk     => s_clk,
            arst    => s_arst,
            d       => s_d,
            q       => s_q,
            q_bar   => s_q_bar
            
        );
        
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    p_reset_gen : process
    begin
        s_arst <= '0';
        wait for 42 ns;
        
        -- Reset activated
        s_arst <= '1';
        wait for 53 ns;

        -- Reset deactivated
        s_arst <= '0';

        wait;
    end process p_reset_gen;
    
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        s_d <= '0';
        wait for 12 ns;
        s_d <= '1';
        wait for 2 ns;
        assert ((s_q = '0') and (s_q_bar = '1'))
        report "Test failed for input combination d = 1, clk = 0, arst = 0." severity error;    --14 ns
        wait for 2 ns;
        assert ((s_q = '1') and (s_q_bar = '0'))
        report "Test failed for input combination d = 1, clk = 1, arst = 0." severity error;    -- 16 ns
        wait for 6 ns;
        s_d <= '0';
        wait for 4 ns;
        assert ((s_q = '0') and (s_q_bar = '1'))
        report "Test failed for input combination d = 0, clk = 1, arst = 0." severity error;    -- 26 ns
        wait for 6 ns;
        s_d <= '1';
        wait for 5 ns;
        s_d <= '0';
        wait for 2 ns;
        assert ((s_q = '1') and (s_q_bar = '0'))
        report "Test failed for input combination d = 0, clk = 1, arst = 0." severity error;    -- 39 ns
        wait for 4 ns;
        assert ((s_q = '0') and (s_q_bar = '1'))
        report "Test failed for input combination d = 0, clk = 0, arst = 1." severity error;    -- 43 ns
        wait for 12 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 6 ns;
        s_d <= '1';
        wait for 20 ns;
        s_d <= '0';
        wait for 10 ns;
        
        s_d <= '1';
        wait for 2 ns;
        
        wait for 8 ns;
        s_d <= '0';
        wait for 2 ns;
        wait for 28 ns;
        s_d <= '1';
        wait for 30 ns;
        s_d <= '0';
        wait for 30 ns;
        s_d <= '1';
        wait for 20 ns;
        s_d <= '0';
        wait for 30 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 20 ns;
        
        wait for 2 ns;
        s_d <= '1';
        wait for 8 ns;
        s_d <= '0';
        wait for 20 ns;
        s_d <= '1';
        wait for 30 ns;
        s_d <= '0';
        wait for 10 ns;
        
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
    

end Behavioral;
