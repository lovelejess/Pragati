Given /^I launch the app$/ do
  element_exists("view")
  sleep(STEP_PAUSE)
end

And /^I should see the Asanas List$/ do
	asana_query = query("view UITableViewCell")
	asana_list = ["Adho Mukha Svanasana", "Urdhva Dhanursana", "Trikonasana (Left)", "Trikonasana (Right)"]
	
	for asana_index in 0..3
		asana_list[asana_index] == asana_query[asana_index]["value"]
 	end
end