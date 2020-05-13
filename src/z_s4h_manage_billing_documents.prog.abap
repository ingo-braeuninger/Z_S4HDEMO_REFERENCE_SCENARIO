*&---------------------------------------------------------------------*
*& Report  z_s4h_adjust_currency_code
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z_s4h_manage_billing_documents.

data l_vbrp  type vbrp.
data lt_vbrp type standard table of vbrp.
data lt_key  type standard table of vbrp-vbeln.
data lt_vbrk type standard table of vbrk.
data l_vbkd  type vbkd.

select * from vbrp into table lt_vbrp where meins = 'KMH'.

clear lt_vbrk.
data fka type range of vbrk-fkart.
select * from vbrk into table lt_vbrk         "#EC CI_ALL_FIELDS_NEEDED
       where fkart in fka and vkorg = '1000' and vtweg = '10'.

clear lt_vbrp.
select a~vbeln b~posnr b~vrkme
  into corresponding fields of table lt_vbrp
  from vbrk as a
  inner join vbrp as b
  on a~vbeln = b~vbeln
  where a~vkorg = '1000'.
