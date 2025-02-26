-- models/customers_renamed.sql

{{ config(materialized='table') }}

select
  StudentId as student_id,
  FirstName as first_name,
  LastName as last_name,
  Age,
  City
from {{ ref('customers') }}
