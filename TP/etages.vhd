-------------------------------------------------

-- Etage FE

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


entity etageFE is
  port(
    npc, npc_fw_br : in std_logic_vector(31 downto 0);

    PCSrc_ER, Bpris_EX, GEL_LI, clk : in std_logic;

    pc_plus_4, i_FE : out std_logic_vector(31 downto 0)
);
end entity;


architecture etageFE_arch of etageFE is
  signal pc_inter, pc_reg_in, pc_reg_out, sig_pc_plus_4, sig_4: std_logic_vector(31 downto 0);
begin

  sig_4 <= (2=>'1', others => '0');
  mem : entity work.inst_mem port map(pc_reg_out,i_FE);
  reg : entity work.Reg32 port map(pc_reg_in, pc_reg_out, GEL_LI,'1',clk);
  add : entity work.addComplex port map(pc_reg_out,sig_4,'0',sig_pc_plus_4);
  pc_inter <= npc when PCSrc_ER = '1' else sig_pc_plus_4 when PCSrc_ER = '0' else (other => '0');
  pc_reg_in <= pc_inter when Bpris_EX = '1' else npc_fw_br when Bpris_EX = '0' else (others => '0');

end architecture;

-- -------------------------------------------------

-- -- Etage DE

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity etageDE is
  port (
    i_DE, WD_ER, pc_plus_4 : in std_logic_vector(31 downto 0);
    Op3_ER : in std_logic_vector(3 downto 0);
    RegSrc, immSrc : in std_logic_vector (1 downto 0);
    RegWr, clk : in std_logic;
    Reg1, Reg_2 : out std_logic_vector(3 downto 0);
    Op1, Op2, extlmm : out std_logic_vector (31 downto 0);
    Op3_DE : out std_logic_vector(3 downto 0) 
    )
end entity

-- -------------------------------------------------

-- -- Etage EX

-- LIBRARY IEEE;
-- USE IEEE.STD_LOGIC_1164.ALL;
-- USE IEEE.NUMERIC_STD.ALL;

-- entity etageEX is
-- end entity
-- -------------------------------------------------

-- -- Etage ME

-- LIBRARY IEEE;
-- USE IEEE.STD_LOGIC_1164.ALL;
-- USE IEEE.NUMERIC_STD.ALL;

-- entity etageME is
-- end entity
-- -------------------------------------------------

-- -- Etage ER

-- LIBRARY IEEE;
-- USE IEEE.STD_LOGIC_1164.ALL;
-- USE IEEE.NUMERIC_STD.ALL;

-- entity etageER is
-- end entity
