library verilog;
use verilog.vl_types.all;
entity dec3to8 is
    port(
        E               : in     vl_logic;
        W               : in     vl_logic_vector(2 downto 0);
        Y_out           : out    vl_logic_vector(6 downto 0)
    );
end dec3to8;
