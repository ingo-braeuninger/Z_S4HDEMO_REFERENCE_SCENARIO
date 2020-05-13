*&---------------------------------------------------------------------*
*& Report z_s4h_check_material_exists
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z_s4h_check_material_exists.

types: begin of material_type,
         material     type matnr,
         availability type flag,
       end of material_type.

"! Material Object
class lcl_material definition.
  public section.
    types: begin of ty_material,
             material     type char18,
             availability type flag,
           end of ty_material.
    methods constructor
      importing
        i_material type any optional.
  protected section.
  private section.
    data material type ty_material.
    methods do_it
      importing
        i_material type any.
endclass.

class lcl_material implementation.
  method constructor.
    me->material = i_material.

    data it_mara type standard table of mara.
    data wa_mara type mara.

    select * from mara into table it_mara where matnr = i_material.

    read table it_mara into wa_mara index 1.

    if sy-subrc = 0.
      do_it( i_material ).
    else.
      exit.
    endif.
  endmethod.

  method do_it.
  endmethod.

endclass.


**********************************************************

start-of-selection.

  parameters mat_num type matnr.

  data material type material_type.
  data material_tmp type lcl_material=>ty_material.

  material-material = mat_num.

  material = material_tmp .

  data material_object type ref to lcl_material.

  material_object = new lcl_material(
      i_material = material_tmp
  ).

  write material-material.
