library verilog;
use verilog.vl_types.all;
entity F is
    port(
        z               : in     vl_logic;
        Clock           : in     vl_logic;
        F_in            : in     vl_logic;
        F_out           : out    vl_logic
    );
end F;
