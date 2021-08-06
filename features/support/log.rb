class Log

    def initialize
        @start_datetime = DateTime.now
        @resultado = "Fail"
        @detalle = nil
        @cdp = nil
        @sku_list = Array.new
        @rclubes = nil
        @descuento = nil	
        @tipo_comprador = nil	
        @rut_comprador = nil 	
        @medio_pago = nil	
        @cuotas = "Sin Cuotas"
    end

    def set_end_datetime
        @end_datetime = DateTime.now
    end

    def set_cdp(value)
        @cdp = value
        puts @cdp
    end
    
    def get_cdp
        return @cdp
    end
    
    def set_duracion
        @duracion = ((@end_datetime - @start_datetime) * 24 * 60 * 60).to_i
    end

    def set_resultado(value)
        @resultado = value
    end

    def get_resultado
        return @resultado
    end

    def set_detalle_resultado(detalle)
        @detalle = detalle
    end

    def get_detalle_resultado
        return @detalle
    end

    def add_sku_list(sku)
        @sku_list << sku
    end

    def set_rclubes(rclubes)
        @rclubes = rclubes
    end

    def set_descuento(descuento)
        @descuento = descuento
    end

    def set_tipo_comprador(tipo_comprador)
        @tipo_comprador = tipo_comprador
    end

    def set_rut_comprador(rut_comprador)
        @rut_comprador = rut_comprador
    end

    def set_medio_pago(medio_pago)
        @medio_pago = medio_pago
    end

    def set_cuotas(cuotas)
        @cuotas = cuotas
    end

    def save_log_ejecucion
        set_end_datetime
        set_duracion
        $tools.ask_and_crear_directorio("features/logs")
        if File.file?("features/logs/log.csv") == false
            puts "CREAR CSV"
            CSV.open("features/logs/log.csv", "wb") do |csv|
                csv << ["cdp", "resultado", "detalle", "start_datetime", "end_datetime", "duracion", "rclubes", "descuento", "tipo_comprador", "rut_comprador", "medio_pago", "cuotas", "sku_1", "sku_2", "sku_3", "sku_4", "sku_5", "sku_6", "sku_7", "sku_8", "sku_9", "sku_10"]
            end
        end
        CSV.open("features/logs/log.csv", "a+") do |csv|
            csv << [@cdp, @resultado, @detalle, @start_datetime, @end_datetime, @duracion, @rclubes, @descuento, @tipo_comprador, @rut_comprador, @medio_pago, @cuotas, @sku_list[0], @sku_list[1], @sku_list[2], @sku_list[3], @sku_list[4], @sku_list[5], @sku_list[6], @sku_list[7], @sku_list[8], @sku_list[9], @sku_list[10]]
        end
    end
end
