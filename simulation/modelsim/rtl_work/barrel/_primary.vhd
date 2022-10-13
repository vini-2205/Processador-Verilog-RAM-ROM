library verilog;
use verilog.vl_types.all;
entity barrel is
    generic(
        lsl             : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        lsr             : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        asr             : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        \ror\           : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        shift_type      : in     vl_logic_vector(1 downto 0);
        shift           : in     vl_logic_vector(3 downto 0);
        data_in         : in     vl_logic_vector(15 downto 0);
        data_out        : out    vl_logic_vector(15 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lsl : constant is 1;
    attribute mti_svvh_generic_type of lsr : constant is 1;
    attribute mti_svvh_generic_type of asr : constant is 1;
    attribute mti_svvh_generic_type of \ror\ : constant is 1;
end barrel;
