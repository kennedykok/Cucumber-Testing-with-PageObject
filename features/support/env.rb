require 'watir'
require 'page-object/page_factory'
require 'page-object'

World(PageObject::PageFactory)

def browser_name
    (ENV['BROWSER'] ||= 'chrome').downcase.to_sym  # allows me to pass browser as a command line argument
end

def assert_it message, &block
    begin
        if (block.call)
            puts "Assertion PASSED for #{message}"
            else
            puts "Assertion FAILED for #{message}"
            fail('Test Failure on assertion')
        end
        rescue => e
        puts "Assertion FAILED for #{message} with exception '#{e}'"
        fail('Test Failure on assertion')
    end
end

Before do |scenario|
    @browser = Watir::Browser.new browser_name
end


After do |scenario|
        
    if scenario.failed?  # the classic take a screenshot if scenario fails block.
        Dir::mkdir('screenshots') if not File.directory?('screenshots')
        screenshot = "./screenshots/FAILED_#{scenario.feature.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
        @browser.driver.save_screenshot(screenshot)
        embed screenshot, 'image/png'
    end
    
    @browser.quit
end
