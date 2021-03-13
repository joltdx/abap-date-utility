*"* use this source file for your ABAP unit test classes
CLASS ltc_date_utility DEFINITION DEFERRED.
CLASS zcl_date_utility DEFINITION LOCAL FRIENDS ltc_date_utility.

CLASS ltc_date_utility DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA m_cut TYPE REF TO zif_date_utility.
    METHODS setup.

    METHODS set_the_date_with_set_method FOR TESTING RAISING cx_static_check.
    METHODS set_the_date_with_constructor FOR TESTING RAISING cx_static_check.
    METHODS default_date_with_constructor FOR TESTING RAISING cx_static_check.
ENDCLASS.

CLASS ltc_date_utility IMPLEMENTATION.

  METHOD setup.
    m_cut = NEW zcl_date_utility( ).
  ENDMETHOD.

  METHOD set_the_date_with_set_method.

    m_cut->set( '20210329' ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210329' ).

  ENDMETHOD.

  METHOD set_the_date_with_constructor.

    DATA cut TYPE REF TO zif_date_utility.
    cut = NEW zcl_date_utility( '20200329' ).

    cl_abap_unit_assert=>assert_equals(
        act = cut->get( )
        exp = '20200329' ).

  ENDMETHOD.

  METHOD default_date_with_constructor.

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = sy-datlo ).

  ENDMETHOD.

ENDCLASS.
