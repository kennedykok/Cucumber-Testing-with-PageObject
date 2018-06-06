
class YouTubePage
		include PageObject
	
	page_url "http://youtube.com"
		
    
	text_field(:searchTerm, :id => 'search')
  	button(:searchButton, :id => 'search-icon-legacy')
  	element(:resultCount, :id=>'result-count')
  
  	def search(term)
  		self.searchTerm = term
  		searchButton
  	end
  
  	def verifyResults
  	
  	
  		#resultCount_element will point to the actual element
  		#resultCount is a String, which is the same as resultCount_element.text
  		
  		resultCount_element.when_present
  		
  		about_results = /About .* results/
  		
  		if (!about_results.match?(resultCount))
  			fail('results not available')
  		end	
    
  	end
end