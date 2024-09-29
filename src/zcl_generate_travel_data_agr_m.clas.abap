CLASS zcl_generate_travel_data_agr_m DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_travel_data_agr_m IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    " empty tables first
    DELETE FROM: ztravel_agr_m,
                 zbooking_agr_m,
                 zbooksuppl_agr_m.
    "output the result as a console message
    out->write( |{ sy-dbcnt } travel entries deleted successfully!| ).

    INSERT ztravel_agr_m FROM ( SELECT * FROM /dmo/travel  ) .
    " output the result as a console message
    out->write( |{ sy-dbcnt } travel entries inserted successfully!| ).

    INSERT zbooking_agr_m FROM ( SELECT * FROM /dmo/booking_m  ) .
    " output the result as a console message
    out->write( |{ sy-dbcnt } travel entries inserted successfully!| ).

    INSERT zbooksuppl_agr_m FROM ( SELECT * FROM /dmo/booksuppl_m  ) .
    " output the result as a console message
    out->write( |{ sy-dbcnt } travel entries inserted successfully!| ).

  ENDMETHOD.

ENDCLASS.
