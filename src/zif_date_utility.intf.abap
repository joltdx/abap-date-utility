INTERFACE zif_date_utility
  PUBLIC .

  METHODS set
    IMPORTING date TYPE d.

  METHODS get
    RETURNING
      VALUE(result) TYPE d.

ENDINTERFACE.
