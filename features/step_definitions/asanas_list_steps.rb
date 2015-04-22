Given /^I launch the app$/ do
  element_exists("view")
  sleep(STEP_PAUSE)
end

And /^I see the Asanas List$/ do
	asana_list = ["Adho Mukha Svanasana", "Urdhva Dhanursana", "Trikonasana (Left)", "Trikonasana (Right)"]
	
	each_cell(:animate => false, :post_scroll=> 0.1) do |row,sec|
		asana_cell = query("tableViewCell indexPath:#{row},#{sec} label", :text).first
		asana_list[row] == asana_cell
 	end
end

And /^I select (.*) from the list$/ do |asana|
	touch("tableViewCell text:'#{asana}'")
	sleep(2)
end

And /^I am on the (.*) photo collection$/ do |asana|
	label("UILabel marked:'#{asana}")
	sleep(5)
end