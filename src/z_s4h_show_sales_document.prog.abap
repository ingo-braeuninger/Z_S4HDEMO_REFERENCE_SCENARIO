report z_s4h_show_sales_document.

*   *********************************************************************
*   *** A   Inquiry
*   *** B   Quotation
*   *** C   Order
*   *** D   Item proposal
*   *** E   Scheduling agreement
*   *** F   Scheduling agreement with external service agent
*   *** G   Contract
*   *** H   Returns
*   *** I   Order w/o charge
*   *** J   Delivery
*   *** K   Credit memo request
*   *** L   Debit memo request
*   *** M   Invoice
*   *** N   Invoice canceled
*   *** O   Credit memo
*   *** P   Debit memo
*   *** Q   WMS transfer order
*   *** R   Goods movement
*   *** S   Credit memo canceled
*   *** T   Returns delivery for order
    DATA lv_vbtyp TYPE vbtyp VALUE 'L'.
    DATA: lc_vbtyp_wa(1) TYPE c.

    CALL FUNCTION 'SD_SALESDOCUMENT_DISPLAY'
      EXPORTING
        i_vbeln      = '24' " Sales and Distribution Document Number
        i_vbtyp      = lv_vbtyp  " Sales Document Category
      EXCEPTIONS
        no_authority = 1
        OTHERS       = 2.
    IF sy-subrc <> 0.
        ...
    ENDIF.
