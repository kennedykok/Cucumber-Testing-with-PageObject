Feature: Search YouTube

Scenario Outline: searching
 	Given We navigate to YouTube
 	When We search for the word "<term>"
 	Then The results of the search will be displayed

    Examples:
        | term |
        | Malaysia |
        | England  |
        | Singapore|
