library verilog;
use verilog.vl_types.all;
entity moduloW is
    port(
        W_D             : in     vl_logic;
        Clock           : in     vl_logic;
        W_out           : out    vl_logic
    );
end moduloW;
