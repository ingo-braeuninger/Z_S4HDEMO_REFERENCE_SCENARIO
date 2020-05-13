report z_s4h_list_marc_records.

select * from marc into table @data(lt_marc)
  where werks = '0001'.

try.

    cl_salv_table=>factory(
      importing r_salv_table = data(lo_alv)
      changing  t_table      = lt_marc ).

    lo_alv->display( ).
  catch cx_salv_error into data(lo_err).
    message lo_err type 'I' display like 'E'.

endtry.
