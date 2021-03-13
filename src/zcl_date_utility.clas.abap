CLASS zcl_date_utility DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_date_utility.

    METHODS constructor
      IMPORTING
        date TYPE d OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA the_date TYPE d.
ENDCLASS.

CLASS zcl_date_utility IMPLEMENTATION.

  METHOD constructor.

    IF date IS SUPPLIED.
      the_date = date.
    ELSE.
      the_date = sy-datlo.
    ENDIF.

  ENDMETHOD.

  METHOD zif_date_utility~get.

    result = the_date.

  ENDMETHOD.

  METHOD zif_date_utility~set.

    the_date = date.

  ENDMETHOD.

ENDCLASS.
