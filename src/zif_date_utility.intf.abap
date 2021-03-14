INTERFACE zif_date_utility
  PUBLIC .

  "! <p class="shorttext synchronized" lang="en">Set a date</p>
  "!
  "! @parameter date | <p class="shorttext synchronized" lang="en">The date to set</p>
  "!
  "! <p><em>Note:</em><br>
  "! If an invalid date is passed, the system will <strong>NOT</strong> be in error but instead set the first valid
  "! date according to ABAP, i.e. 00010102.</p>
  METHODS set
    IMPORTING date TYPE d.

  "! <p class="shorttext synchronized" lang="en">Get the date</p>
  "!
  "! @parameter result | <p class="shorttext synchronized" lang="en">The date you get</p>
  METHODS get
    RETURNING
      VALUE(result) TYPE d.

  "! <p class="shorttext synchronized" lang="en">Add a number of days</p>
  "!
  "! @parameter days | <p class="shorttext synchronized" lang="en">The number of days to add</p>
  "! @parameter date_utility | <p class="shorttext synchronized" lang="en">Self reference for method chaining</p>
  METHODS add_days
    IMPORTING
      days                TYPE i
    RETURNING
      VALUE(date_utility) TYPE REF TO zif_date_utility.

  "! <p class="shorttext synchronized" lang="en">Add a number of months</p>
  "!
  "! @parameter months | <p class="shorttext synchronized" lang="en">The number of months to add</p>
  "! @parameter date_utility | <p class="shorttext synchronized" lang="en">Self reference for method chaining</p>
  METHODS add_months
    IMPORTING
      months              TYPE i
    RETURNING
      VALUE(date_utility) TYPE REF TO zif_date_utility.

  "! <p class="shorttext synchronized" lang="en">Add a number of years</p>
  "!
  "! @parameter years | <p class="shorttext synchronized" lang="en">The number of years to add</p>
  "! @parameter date_utility | <p class="shorttext synchronized" lang="en">Self reference for method chaining</p>
  METHODS add_years
    IMPORTING
      years               TYPE i
    RETURNING
      VALUE(date_utility) TYPE REF TO zif_date_utility.

ENDINTERFACE.
