library verilog;
use verilog.vl_types.all;
entity ULA is
    port(
        BusWires        : in     vl_logic_vector(15 downto 0);
        A               : in     vl_logic_vector(15 downto 0);
        shift_out       : in     vl_logic_vector(15 downto 0);
        shift_in        : in     vl_logic;
        ALU             : in     vl_logic_vector(1 downto 0);
        Saida_ALU       : out    vl_logic_vector(15 downto 0);
        z_flag          : out    vl_logic
    );
end ULA;
