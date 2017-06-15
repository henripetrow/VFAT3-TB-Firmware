
 add_fsm_encoding \
       {transactor_if.state} \
       { }  \
       {{000 0000001} {001 0000010} {010 0000100} {011 0010000} {100 0100000} {101 0001000} {110 1000000} }

 add_fsm_encoding \
       {transactor_sm.state} \
       { }  \
       {{000 000001} {001 000010} {010 000100} {011 001000} {100 010000} {101 100000} }

 add_fsm_encoding \
       {control.state} \
       { }  \
       {{000 0000001} {001 0000100} {010 0001000} {011 0100000} {100 0010000} {101 1000000} {110 0000010} }

 add_fsm_encoding \
       {dser_sync.state_p} \
       { }  \
       {{000 000} {001 001} {010 100} {011 101} {100 010} {101 011} }

 add_fsm_encoding \
       {control_adc.state} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} }
