*** Settings ***
Library         REST    https://carrestapi.herokuapp.com/

*** Variables ***
${json}         { "brand": "Volkswagen", "model": "Beetle", "color": "Red", "fuel": "Diesel", "year": 1950, "price": 17500 }


*** Test Cases ***
GET an existing car
    GET         /cars/1
    Object      response body
    Integer     response body year        2013
    String      response body brand       Ford
    String      response body model       Mondeo
    [Teardown]  Output  response body

POST with valid params to create a new car
    POST        /cars                     ${json}
    Integer     response status           201
    [Teardown]  Output  response body


PUT with valid params to update the existing cars color
    PUT         /cars/2                   { "color": "Red" }
    String      response body color       Red
    [Teardown]  Output  response body
