Before do
  $driver.start_driver
end

After do |scenario|
  if scenario.failed?
    $scenario_name = scenario.name
    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    screenshot_name = "fail_#{$scenario_name}_#{time_stamp}.png"
    screenshot_file = File.join("screenshots", screenshot_name)
    $driver.screenshot(screenshot_file)
  end

  $driver.driver_quit
end