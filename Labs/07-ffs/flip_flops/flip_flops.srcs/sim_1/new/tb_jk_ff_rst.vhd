----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2021 13:47:34
-- Design Name: 
-- Module Name: tb_jk_ff_rst - Behavioral
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

entity tb_jk_ff_rst is
--  Port ( );
end tb_jk_ff_rst;

architecture Behavioral of tb_jk_ff_rst is

    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    signal s_clk   : std_logic;
    signal s_rst  : std_logic;
    signal s_j     : std_logic;
    signal s_k     : std_logic;
    signal s_q     : std_logic;
    signal s_q_bar : std_logic;
begin

    uut_jk_ff_rst : entity work.jk_ff_rst
        port map(
            clk     => s_clk,
            rst     => s_rst,
            j       => s_j,
            k       => s_k,
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
        s_rst <= '0';
        wait for 42 ns;
        
        -- Reset activated
        s_rst <= '1';
        wait for 53 ns;

        -- Reset deactivated
        s_rst <= '0';

        wait for 81 ns;
        
        s_rst <= '1';
        wait for 25 ns;

        s_rst <= '0';
        wait;
    end process p_reset_gen;
    
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        s_j <= '0'; s_k <= '0';
        wait for 12 ns;
        s_k <= '1';
        wait for 10 ns;
        s_j <= '1'; s_k <= '0';
        wait for 10 ns;
        s_k <= '1';
        wait for 5 ns;
        s_j <= '0';
        wait for 20 ns;
        s_j <= '1';
        wait for 10 ns;
        s_k <= '0';
        wait for 5 ns;
        s_j <= '0';
        wait for 20 ns;
        s_j <= '1'; s_k <= '1';
        wait for 10 ns;
        
        s_j <= '0'; s_k <= '0';
        wait for 20 ns;
        s_k <= '1';
        wait for 8 ns;
        s_j <= '1'; s_k <= '0';
        wait for 10 ns;
        s_k <= '1';
        wait for 35 ns;
        s_j <= '0';
        wait for 20 ns;
        s_j <= '1';
        wait for 10 ns;
        s_k <= '0';
        wait for 7 ns;
        s_j <= '0';
        wait for 12 ns;
        s_j <= '1'; s_k <= '1';
        wait for 10 ns;
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
    
    p_asserts : process
    begin
        wait for 18 ns;
        assert ((s_q = '0') and (s_q_bar = '1'))
        report "Test failed for input combination j = 0, k = 1, clk = 1, rst = 0." severity error;     --18 ns
        wait for 5 ns;
        assert ((s_q = '0') and (s_q_bar = '1'))
        report "Test failed for input combination j = 1, k = 0, clk = 0, rst = 0." severity error;     -- 23 ns
        wait for 4 ns;
        assert ((s_q = '1') and (s_q_bar = '0'))
        report "Test failed for input combination j = 1, k = 0, clk = 1, rst = 0." severity error;     -- 27 ns
        wait for 2 ns;
        assert ((s_q = '0') and (s_q_bar = '1'))
        report "Test failed for input combination j = 0, k = 1, clk = 1, rst = 0." severity error;     -- 38 ns
        wait for 32 ns;        
        assert ((s_q = '0') and (s_q_bar = '1'))
        report "Test failed for input combination j = 0, k = 1, clk = 1, rst = 1." severity error;     -- 47 ns
        
        wait;
    end process p_asserts;
    

end Behavioral;
