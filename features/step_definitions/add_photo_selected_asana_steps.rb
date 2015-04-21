And /^I press the add button$/ do
	sleep(2)
	touch("UINavigationButton marked:'Add'")
end

And /^I can select a photo from my photo album$/ do
	sleep(2)
	query("UINavigationItemView  marked:'Add a Photo'")
	touch("UINavigationButton  marked:'Share'")
	touch("PUAlbumListCellContentView marked:'Moments'")
	print touch("PUAlbumListCellContentView marked:'Moments'")
	print("\n\n\n\n")
	sleep(2)
	touch(nil, :offset => {:x=>80.5, :y=>57.5})
end

And /^I can save that photo$/ do
	pending
	touch("UIButtonLabel marked:'Save'")
end