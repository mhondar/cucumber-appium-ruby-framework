class MonitorPage
  
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/all_selectors.json"))
        @datos = JSON.parse(File.read("./features/data/datos.json"))
    end

    def click_cambiar_vendedor
        @btnBarCode = find_element(id: @selectors["monitor"]["change_employee"])
        $tools.click(@btnBarCode)
    end

    def insertarTexto_field_data (text)
        @txtDatos =  find_element(id: @selectors ["general"]["txtDatos"])
        $tools.insertar_texto(@txtDatos, text)
        click_buttom_go_pay_cart
    end

    def click_buttom_go_pay_cart
        @buttom_go_pay_cart =  find_element(id: @selectors["general"]["buttom_go_pay_cart"])
        $tools.click(@buttom_go_pay_cart)
    end

    def click_btn_config
        @btn_config = find_element(id: @selectors["monitor"]["btn_config"])
        $tools.click(@btn_config)
    end

    def ingresar_rut_vendedor
        rutMonitor = @datos["rutMonitor"].shuffle.first 
        insertarTexto_field_data(rutMonitor)
    end

    def guardar_y_Salir
        begin
            @btnGuardarConfiguracion = find_element(id: @selectors["monitor"]["button_save_config"])
        rescue
            $tools.fallo("Falla en la configuración del Monitor")
        end
        $tools.click(@btnGuardarConfiguracion)
        click_btn_config
        @btnGuardarConfiguracion =  find_element(id: @selectors["monitor"]["button_save_config"])
        $tools.click(@btnGuardarConfiguracion)
    end

end