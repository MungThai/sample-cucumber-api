Feature: Google Maps Rest API

@github
Scenario: github auth
Given a rest api "Github"
And basic authorisation
When the system requests GET "/zen"
Then the response code is 200