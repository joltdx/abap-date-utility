INTERFACE zif_date_utility
  PUBLIC .

  "! <p class="shorttext synchronized" lang="en">Set a date</p>
  "!
  "! @parameter date | <p class="shorttext synchronized" lang="en">The date to set</p>
  METHODS set
    IMPORTING date TYPE d.

  "! <p class="shorttext synchronized" lang="en">Get the date</p>
  "!
  "! @parameter result | <p class="shorttext synchronized" lang="en">The date you get</p>
  METHODS get
    RETURNING
      VALUE(result) TYPE d.

ENDINTERFACE.
