report z_s4h_dashb_sap_transactions.

selection-screen begin of block block.

parameters : mb11 radiobutton group rbg1 default 'X'.
parameters : matgrp03 radiobutton group rbg1.

selection-screen end of block block.

start-of-selection.

  if mb11 = 'X'.
    call transaction 'MB11' with authority-check.

  elseif matgrp03 = 'X'.
    call transaction 'MATGRP03' with authority-check.
  endif.
