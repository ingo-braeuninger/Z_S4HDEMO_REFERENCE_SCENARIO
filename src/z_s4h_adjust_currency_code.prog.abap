*&---------------------------------------------------------------------*
*& Report  z_s4h_adjust_currency_code*&
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z_s4h_adjust_currency_code.

tables: konv.

parameters: i_knumv like konv-knumv,
            i_kposn like konv-kposn,
            i_stunr like konv-stunr,
            i_zaehk like konv-zaehk.

selection-screen skip.

parameters: i_waersn like konv-waers obligatory.

select single * from konv where knumv = i_knumv
                            and kposn = i_kposn
                            and stunr = i_stunr
                            and zaehk = i_zaehk.

if sy-subrc = 0.
  update konv set waers = i_waersn
          where knumv = i_knumv
            and kposn = i_kposn
            and stunr = i_stunr
            and zaehk = i_zaehk.
  write: / 'Old Currency :', konv-waers.
else.
  write: / 'No entry in KONV table'.
endif.
