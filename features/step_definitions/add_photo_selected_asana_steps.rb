And /^I press the add button$/ do
	sleep(2)
	touch("UINavigationButton marked:'Add'")
end

And /^I can select a photo from my photo album$/ do
	sleep(2)
	query("UINavigationItemView  marked:'Add a Photo'")
	touch("UINavigationButton  marked:'Share'")
	touch("PUAlbumListCellContentView marked:'Moments'")
	sleep(5)
	touch("PUPhotosGridCell marked:'Photo, Landscape, July 13, 2014, 11:28 PM'")
	sleep(5)
end

And /^I can save that photo$/ do
	sleep(3)
	touch("UIButtonLabel marked:'Save'")
end
