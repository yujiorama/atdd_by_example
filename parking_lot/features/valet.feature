Feature: Valet Parking feature
  The parking lot calculator calculates costs for Valet Parking.

  Scenario Outline: Calculate Valet Parking Cost
    When I park my car in the Valet Parking Lot for <parking duration>
    Then I will have to pay <parking costs>

Examples:
| parking duration | parking costs |
| 30 minutes       | $ 12.00       |

