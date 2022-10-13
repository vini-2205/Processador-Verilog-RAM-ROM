library verilog;
use verilog.vl_types.all;
entity ROM is
    port(
        address         : in     vl_logic_vector(5 downto 0);
        clock           : in     vl_logic;
        q               : out    vl_logic_vector(15 downto 0)
    );
end ROM;
