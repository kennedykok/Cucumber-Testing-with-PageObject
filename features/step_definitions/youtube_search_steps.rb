

Given(/^We navigate to YouTube$/) do
    visit YouTubePage
end

When(/^We search for the word "([^"]*)"$/) do |arg|
	on(YouTubePage).search("#{arg}")
    @searched = true
end

Then(/^The results of the search will be displayed$/) do
	on(YouTubePage).verifyResults
end
