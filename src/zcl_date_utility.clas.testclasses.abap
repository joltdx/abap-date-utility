*"* use this source file for your ABAP unit test classes
CLASS ltc_date_utility DEFINITION DEFERRED.
CLASS zcl_date_utility DEFINITION LOCAL FRIENDS ltc_date_utility.

CLASS ltc_date_utility DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA m_cut TYPE REF TO zif_date_utility.
    METHODS setup.

    METHODS set_date_with_set_method FOR TESTING RAISING cx_static_check.
    METHODS set_date_with_constructor FOR TESTING RAISING cx_static_check.
    METHODS default_date_with_constructor FOR TESTING RAISING cx_static_check.
    METHODS set_invalid_date FOR TESTING RAISING cx_static_check.

    METHODS add_1_day_to_date FOR TESTING RAISING cx_static_check.
    METHODS add_1_day_into_next_month FOR TESTING RAISING cx_static_check.
    METHODS add_1_day_into_next_year FOR TESTING RAISING cx_static_check.
    METHODS add_1_day_to_leap_day FOR TESTING RAISING cx_static_check.
    METHODS add_negative_1_day_to_date FOR TESTING RAISING cx_static_check.

    METHODS add_1_month_to_date FOR TESTING RAISING cx_static_check.
    METHODS add_1_month_into_next_year FOR TESTING RAISING cx_static_check.
    METHODS add_1_month_to_end_of_month30 FOR TESTING RAISING cx_static_check.
    METHODS add_1_month_to_end_of_month31 FOR TESTING RAISING cx_static_check.
    METHODS add_1_month_to_end_of_july FOR TESTING RAISING cx_static_check.
    METHODS add_1_month_to_end_of_january FOR TESTING RAISING cx_static_check.
    METHODS add_1_month_to_end_of_jan_leap FOR TESTING RAISING cx_static_check.
    METHODS add_1_month_to_end_of_february FOR TESTING RAISING cx_static_check.
    METHODS add_minus_1_month_to_date FOR TESTING RAISING cx_static_check.

    METHODS add_1_year_to_date FOR TESTING RAISING cx_static_check.
    METHODS add_1_year_to_february_29 FOR TESTING RAISING cx_static_check.
    METHODS add_1_year_into_february_29 FOR TESTING RAISING cx_static_check.
    METHODS add_4_years_to_february_29 FOR TESTING RAISING cx_static_check.
    METHODS add_minus_1_year_to_date FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_date_utility IMPLEMENTATION.

  METHOD setup.
    m_cut = NEW zcl_date_utility( ).
  ENDMETHOD.

  METHOD set_date_with_set_method.

    m_cut->set( '20210329' ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210329' ).

  ENDMETHOD.

  METHOD set_date_with_constructor.

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

  METHOD set_invalid_date.

    m_cut->set( '20200242' ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '00010102' ).

  ENDMETHOD.

  METHOD add_1_day_to_date.

    m_cut->set( '20210314' )->add_days( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210315' ).

  ENDMETHOD.

  METHOD add_1_day_into_next_month.

    m_cut->set( '20210331' )->add_days( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210401' ).

  ENDMETHOD.

  METHOD add_1_day_into_next_year.

    m_cut->set( '20211231' )->add_days( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20220101' ).

  ENDMETHOD.

  METHOD add_1_day_to_leap_day.

    m_cut->set( '20200228' )->add_days( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20200229' ).

  ENDMETHOD.

  METHOD add_negative_1_day_to_date.

    m_cut->set( '20210704' )->add_days( -1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210703' ).

  ENDMETHOD.

  METHOD add_1_month_to_date.

    m_cut->set( '20210609' )->add_months( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210709' ).

  ENDMETHOD.

  METHOD add_1_month_into_next_year.

    m_cut->set( '20211217' )->add_months( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20220117' ).

  ENDMETHOD.

  METHOD add_1_year_to_date.

    m_cut->set( '20210919' )->add_years( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20220919' ).

  ENDMETHOD.

  METHOD add_1_month_to_end_of_month31.

    m_cut->set( '20210331' )->add_months( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210430' ).

  ENDMETHOD.

  METHOD add_1_month_to_end_of_month30.

    m_cut->set( '20210430' )->add_months( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210531' ).

  ENDMETHOD.

  METHOD add_1_month_to_end_of_january.

    m_cut->set( '20210131' )->add_months( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210228' ).

  ENDMETHOD.

  METHOD add_1_month_to_end_of_february.

    m_cut->set( '20210228' )->add_months( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210331' ).

  ENDMETHOD.

  METHOD add_1_month_to_end_of_july.

    m_cut->set( '20210731' )->add_months( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210831' ).

  ENDMETHOD.

  METHOD add_1_month_to_end_of_jan_leap.

    m_cut->set( '20200131' )->add_months( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20200229' ).

  ENDMETHOD.

  METHOD add_minus_1_month_to_date.

    m_cut->set( '20210315' )->add_months( -1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210215' ).

  ENDMETHOD.

  METHOD add_1_year_to_february_29.

    m_cut->set( '20200229' )->add_years( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20210228' ).

  ENDMETHOD.

  METHOD add_1_year_into_february_29.

    m_cut->set( '20190228' ).

    m_cut->add_years( 1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20200229' ).

  ENDMETHOD.

  METHOD add_4_years_to_february_29.

    m_cut->set( '20200229' )->add_years( 4 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20240229' ).

  ENDMETHOD.

  METHOD add_minus_1_year_to_date.

    m_cut->set( '20210315' )->add_years( -1 ).

    cl_abap_unit_assert=>assert_equals(
        act = m_cut->get( )
        exp = '20200315' ).

  ENDMETHOD.

ENDCLASS.
