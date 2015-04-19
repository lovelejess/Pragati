Feature: Display Asanas List

Scenario: 
	Given I launch the app
	Then I see the Asanas List

Scenario: Adho Mukha Svanasana 
	Given I launch the app
	And I see the Asanas List
	When I select Adho Mukha Svanasana from the list
	Then I am on the Downward Facing Dog photo collection

Scenario: Urdhva Dhanursana
	Given I launch the app
	And I see the Asanas List
	When I select Urdhva Dhanursana from the list
	Then I am on the Upward Bow Pose photo collection 

Scenario: Trikonasana (Left)
	Given I launch the app
	And I see the Asanas List
	When I select Trikonasana (Left) from the list
	Then I am on the Triangle (Left) photo collection 

Scenario: Trikonasana (Right)
	Given I launch the app
	And I see the Asanas List
	When I select Trikonasana (Right) from the list
	Then I am on the Triangle (Right) photo collection 

