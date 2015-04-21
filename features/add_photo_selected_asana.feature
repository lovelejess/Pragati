Feature: Add Photo to Selected Asana Photo Collection

Scenario: Add a Photo to Selected Asana 
	Given I launch the app 
	And I select Adho Mukha Svanasana from the list
	And I am on the Downward Facing Dog photo collection
	When I press the add button
	Then I can select a photo from my photo album
	And I can save that photo
	And I am on the Downward Facing Dog photo collection