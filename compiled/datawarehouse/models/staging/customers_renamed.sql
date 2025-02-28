-- models/customers_renamed.sql



select
  StudentId as student_id,
  FirstName as first_name,
  LastName as last_name,
  Age,
  City
from "dbtTest"."raw"."customers"