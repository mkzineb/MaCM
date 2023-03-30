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
FE : entity work.etageFE port(npc_t, npc_fw_br_t, pc_plus4_t, i_FE_t, PCSrc_ER_t, Bpris_EX_t, Gel_LI, clk_t )
process 
begin 
npc_t <= (others => '0');
npc_fw_br_t<= (others => '0');
PCSrc_ER_t <= '0';
Bpris_EX_t <= '0';
Gel_LI <= '1';
clk_t <= '0';
wait for 5n;
clk_t <= '1';
wait for 5n;
clk_t <= '0';
wait until (clk='0'); 
	assert FALSE report "FIN DE SIMULATION" severity FAILURE;

end process;

end test;