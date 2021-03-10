Before do
  $driver.start_driver
  @driver.start_recording_screen video_size: '1280x720', time_limit: '1500', bit_rate: '700000', bug_report: true
  FileUtils.mkdir_p "#{$project_path}/reports/#{ENV["device"]}/#{ENV["feature"]}"
end

After do |scenario|
  if scenario.failed?
    $feature_name = scenario.feature.name
    $scenario_name = scenario.name

    # Проверяем существование директории для отчёта, если нет - создаём её с именем функциональности
    destination = "#{$project_path}/reports/#{ENV["device"]}/#{$feature_name}"
    if File.exist? (destination)
    else
      FileUtils.mkdir_p (destination)
    end

    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    base64String = @driver.stop_recording_screen
    File.open("reports/#{ENV["device"]}/#{$feature_name}/fail_#{$scenario_name}_#{time_stamp}.mp4", "wb") do |file|
      file.write(Base64.decode64(base64String))
    end
    video = File.open("#{$project_path}/reports/#{ENV["device"]}/#{$feature_name}/fail_#{$scenario_name}_#{time_stamp}.mp4")
    attach_file("video_fail_#{$scenario_name}_#{time_stamp}", video, false) rescue puts "Ошибка1"

    # Скриним последний экран
    screenshot_name = "fail_#{$scenario_name}_#{time_stamp}.png"
    screenshot_file = File.join("#{destination}/", screenshot_name)
    $driver.screenshot(screenshot_file)
  end

  $driver.driver_quit
end