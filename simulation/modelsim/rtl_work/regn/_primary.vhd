library verilog;
use verilog.vl_types.all;
entity regn is
    port(
        BusWires        : in     vl_logic_vector(15 downto 0);
        validar         : in     vl_logic;
        Clock           : in     vl_logic;
        data_saida      : out    vl_logic_vector(15 downto 0)
    );
end regn;
