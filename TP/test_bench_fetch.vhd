library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- def composant
entity test_fetch is
end test_fetch;

architecture test of test_fetch is
signal npc_t, npc_fw_br_t, pc_plus4_t, i_FE_t : in std_logic_vector(31 downto 0);
Signal PCSrc_ER_t, Bpris_EX_t, Gel_LI, clk_t : std_logic;

begin 
FE : entity work.etageFE port map (npc_t, npc_fw_br_t, PCSrc_ER_t, Bpris_EX_t, Gel_LI, clk_t, pc_plus4_t, i_FE_t )
process 
begin 
npc_t <= (others => '0');
npc_fw_br_t<= (others => '0');
PCSrc_ER_t <= '0';
Bpris_EX_t <= '0';
Gel_LI <= '1';
clk_t <= '0';
wait for 5 ns;
clk_t <= '1';
wait for 5 ns;
clk_t <= '0';
wait for 5 ns;
wait;
end process;
end architecture;

entity test_DE is 
end entity;

architecture test of test_EX is
end test;

entity test_EX is 
end entity;

architecture test of test_EX is
end test;

entity test_ME is 
end entity;

architecture test of test_ME is
end test;

entity test_ER is 
end entity;

architecture test of test_ER is
end test;