report z_s4h_bseg_data_check.

types: begin of bseg_subset,
         bkurs type bseg-bukrs,
         belnr type bseg-belnr,
         gjahr type bseg-gjahr,
         buzei type bseg-buzei,
       end of bseg_subset.
data: i_bseg_entries type standard table of bseg,
      i_bseg         type standard table of bseg, i_buzei type bseg-buzei,
      i_bseg_sub     type standard table of bseg_subset, is_bseg type bseg,
      i_bukrs        type bseg-bukrs, i_belnr type bseg-belnr,
      i_gjahr        type bseg-gjahr,
      i_buzid        type bseg-buzid, p_bukrs type bseg-bukrs,
      gt_bseg        type table of bseg with header line.


parameters fiscyear type gjahr.


select * from bseg into corresponding fields of table i_bseg
where bukrs = i_bukrs and
      belnr = i_belnr and
      gjahr = fiscyear order by primary key.


data alv type ref to cl_salv_table.

cl_salv_table=>factory(
*  exporting
*    list_display   = if_salv_c_bool_sap=>false
*    r_container    =
*    container_name =
  importing
    r_salv_table   = alv
  changing
    t_table        = i_bseg
).
*catch cx_salv_msg.
*catch cx_salv_msg.

alv->display( ).
