library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        BusWires        : in     vl_logic_vector(15 downto 0);
        pc_in           : in     vl_logic;
        pc_incr         : in     vl_logic;
        Clock           : in     vl_logic;
        PC_out          : out    vl_logic_vector(15 downto 0)
    );
end PC;
