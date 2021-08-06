Before do
  $driver.start_driver
  manage.timeouts.implicit_wait = 30
  init_global_var
  sleep 3
end

def init_global_var
  $tools = Tools.new                        #objeto de herramientas comunes
  $name = "name"
  $log = Log.new
  $end = false
  $imagenes = ENV['ATTACH']
  $reporte = ENV['REPORT']
  $proyecto = ENV['PROJECT']
  $screenshots = ENV['SCREENSHOT']
  $end = false
  $tools.ask_and_crear_directorio("features/reports/json")
  $tools.ask_and_crear_directorio("features/reports/report_builder")
  $tools.ask_and_crear_directorio("features/screenshots/pass")
  $tools.ask_and_crear_directorio("features/screenshots/fin_script")

end
  
After do |scenario|
  $tools = Tools.new  
  sleep 3
  if scenario.failed?
    $log.set_resultado("Fail")
    if $log.get_detalle_resultado == nil
        $log.set_detalle_resultado("Se desconoce causa de Fallo")
    end
    $tools.salvar_pantalla("Fail", "features/screenshots/fail/")
  else
    $log.set_resultado("Pass")
    $log.set_detalle_resultado("Caso de Prueba Exitoso")
    $tools.salvar_pantalla('Pass', 'features/screenshots/pass/')
  end
  $tools.salvar_pantalla("End", "features/screenshots/fin_script/")
  $log.save_log_ejecucion
  if($imagenes == true)
   puts "Atach Imagen"
   atash_images
  end
  if ENV['CLOSE'] == "true"
   $driver.driver_quit
 end
end

at_exit do
  if ENV['REPORT'] == "true"
    generar_report_builder
    FileUtils.rm_rf(Dir.glob('features/reports/json/*'))
  end  
    CSV.open("features/logs/log.csv", "a+") do |csv|
      csv << [ ]
    end
end

def atash_images
  encoded_img = $driver.screenshot(:base64)
  embed("data:image/png;base64,#{encoded_img}",'image/png')
end

def generar_report_builder
    puts "Generar Report Builder"
    unless File.directory?('features/reports/report_builder')
        FileUtils.mkdir_p('features/reports/report_builder')
    end
    ReportBuilder.input_path = 'features/reports/json'
    tiempo = DateTime.now.to_s.gsub(':', '_')
    ReportBuilder.configure do |config|
        config.report_path = 'features/reports/report_builder/report_builder_' + $proyecto + '_' + tiempo
        config.report_types = [:json, :html]
        config.report_title = 'Reporte de Pruebas Automatizadas ' + $proyecto
        config.additional_info = {device: "Android", environment: "QA"}
        config.include_images = true
        config.color = 'purple'
      end
      ReportBuilder.build_report

      s3 = Aws::S3::Resource.new(region:'us-east-1')
      obj = s3.bucket('cucumber-rap-automation').object('Reportes/'+ $proyecto +'/report_builder_' + $proyecto + '_' + tiempo + '.html')
      obj.upload_file( 'features/reports/report_builder/report_builder_' + $proyecto + '_' + tiempo + '.html')

      obj = s3.bucket('cucumber-rap-automation').object('Reportes/'+ $proyecto +'/report_builder_' + $proyecto + '_' + tiempo + '.json')
      obj.upload_file( 'features/reports/report_builder/report_builder_' + $proyecto + '_' + tiempo + '.json')
end


