CLASS zcl_date_utility DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_date_utility.

    "! <p class="shorttext synchronized" lang="en">Generate a new date utility object</p>
    "!
    "! @parameter date | <p class="shorttext synchronized" lang="en">Optional initial date.
    "! Current local date if not specified</p>
    METHODS constructor
      IMPORTING
        date TYPE d OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA the_date TYPE d.

    METHODS is_end_of_month
      IMPORTING
        date          TYPE d
      RETURNING
        VALUE(result) TYPE abap_bool.

    METHODS get_as_end_of_month
      IMPORTING
        date          TYPE d
      RETURNING
        VALUE(result) TYPE d.

ENDCLASS.

CLASS zcl_date_utility IMPLEMENTATION.

  METHOD constructor.

    IF date IS SUPPLIED.
      zif_date_utility~set( date ).
    ELSE.
      zif_date_utility~set( sy-datlo ).
    ENDIF.

  ENDMETHOD.

  METHOD get_as_end_of_month.

    result = date.
    DATA(this_month) = date+4(2).
    IF this_month < 12.
      result+4(2) = this_month + 1.
      result+6(2) = '01'.
      result = result - 1.
    ELSE.
      result+6(2) = '31'.
    ENDIF.

  ENDMETHOD.

  METHOD is_end_of_month.

    DATA(this_month) = date+4(2).
    DATA(next_day) = CONV d( date + 1 ).
    DATA(next_days_month) = next_day+4(2).

    IF next_days_month <> this_month.
      result = abap_true.
    ENDIF.

  ENDMETHOD.

  METHOD zif_date_utility~get.

    result = the_date.

  ENDMETHOD.

  METHOD zif_date_utility~set.

    the_date = date + 1 - 1.

    IF the_date = '00000000'.
      the_date = the_date + 1.
    ENDIF.

  ENDMETHOD.

  METHOD zif_date_utility~add_days.

    the_date = the_date + days.

    date_utility = me.

  ENDMETHOD.

  METHOD zif_date_utility~add_months.

    DATA(month) = the_date+4(2).

    DATA(next_day) = CONV d( the_date + 1 ).
    DATA(end_of_month) = is_end_of_month( the_date ).

    DATA(target_month) = month + months.
    DATA(years_to_add) = ( target_month - 1 ) DIV 12.
    DATA(new_month) = ( ( target_month - 1 ) MOD 12 ) + 1.

    IF years_to_add > 0.
      zif_date_utility~add_years( CONV #( years_to_add ) ).
    ENDIF.

    the_date+4(2) = new_month.

    IF end_of_month = abap_true.
      the_date = get_as_end_of_month( the_date ).
    ENDIF.

    date_utility = me.

  ENDMETHOD.

  METHOD zif_date_utility~add_years.

    DATA(year) = the_date+0(4).

    year = year + years.

    the_date+0(4) = year.

  ENDMETHOD.

ENDCLASS.
