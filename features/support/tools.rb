require 'date'

class Tools
   
    def click(element)
        element.click
    end

    def esperar_elemento(element)
        # wait_true { find_element(:id, element).displayed? }
        # wait.until { element.displayed? }
        wait_true { exists { element } }
    end

    def insertar_texto(elemento, texto)
        elemento.send_keys(texto)
    end

    def concatenar_fecha_desglosada(anio,mes,dia)
        return anio.to_s + "-" + mes.to_s + "-" + dia.to_s
    end

    def salvar_pantalla(step, ruta)
        if $screenshots == "true"
            puts "Salva de Screenshot #{step}"
            ask_and_crear_directorio(ruta)
            filename = $name + "_" + step + "_" + filename_time
            direccion = ruta + filename + ".png"
            $driver.screenshot(direccion)
        end
    end

    def ask_and_crear_directorio(ruta)
        unless File.directory?(ruta)
            FileUtils.mkdir_p(ruta)
        end
    end

    def ask_and_crear_file(ruta, file)
        unless File.directory?(ruta)
            FileUtils.mkdir_p(ruta)
        end
        if File.file?(ruta + "/" + file) == false
            puts "CREAR CSV"
            CSV.open(ruta + "/" + file, "wb") do |csv|
                csv << [ruta + "/" + file]
            end
        end
    end

    def filename_time
        time_now = Time.now.to_s
        file_name = time_now[0..18]
        file_name[10] = "_"
        file_name[13] = "H"
        file_name[16] = "M"
        file_name[19] = "S"
        return file_name
    end

    # GENERADOR DE RUT *******
    def get_documento
        case $pais
        when "cl"
            numero = concant_number
            dv = calcula_dv(numero)
            return "#{numero}#{dv}"
        else
            dni = get_dni
            puts "documento: #{dni}"
            return get_dni
        end
    end

    def concant_number
        return "#{obtener_sum_number}#{random_num}"
    end

    def calcula_dv(number)
        reversed_digits = number.to_s.reverse.chars.map(&:to_i)
        factors = (2..7).to_a.cycle
        suma = reversed_digits.zip(factors).inject(0) {|sum, (d, f)| sum + d * f }
        dv = (-suma) % 11 == 10 ? 'K' : (-suma) % 11
    end

    def get_dni
        sum_number = obtener_sum_number
        random = random_num
        return "#{sum_number}#{random}"
    end

    def obtener_sum_number
        time = Time.new
        year = time.year
        month = time.month
        day = time.day
        min = time.min
        sec = time.sec
        sum_number =  year + month + day + min + sec
        return sum_number.to_s
    end

    def random_num
        r = Random.new
        return r.rand(1000...9999).to_s
    end

    #FIN GENERADOR DE RUT ********

    def fallo(mensaje)
        $log.set_detalle_resultado(mensaje)
        $tools.salvar_pantalla("Fail", "features/screenshots/fails/")
        fail(mensaje)
    end

    def return_numero_mes
        t = Time.now
        return t.strftime("%m")
    end

end
