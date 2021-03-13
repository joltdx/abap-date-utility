CLASS zcl_date_utility DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_date_utility.

    "! <p class="shorttext synchronized" lang="en">Generate a new date utility object</p>
    "!
    "! @parameter date | <p class="shorttext synchronized" lang="en">Optional initial date. Current local date if not specified</p>
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
