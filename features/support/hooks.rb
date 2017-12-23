Before do
  visit ''
end

After do |scenario|
  if scenario.failed?
    if !File.directory?("screenshots")
      FileUtils.mkdir_p("screenshots")
    end

    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    screenshot_name = time_stamp + ".png"
    screenshot_file = File.join("screenshots", screenshot_name)
    page.save_screenshot(screenshot_file)
    embed("#{screenshot_file}", "image/png")
  end

  ####CHROMEDRIVER######
  #Capybara.current_session.driver.quit
end

AfterConfiguration do
  FileUtils.rm_r("screenshots") if File.directory?("screenshots")
end


