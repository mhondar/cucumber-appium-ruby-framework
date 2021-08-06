class PagoPage
  
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/all_selectors.json"))
    end

    def seleccionar_tarjeta(tipoPago)
        @btnTipoPago =  find_element(id: @selectors["pago"]["metodos_pago"][tipoPago])
        $tools.click(@btnTipoPago) 
        $log.set_medio_pago(tipoPago)      
    end

    def click_continuar 
        @btn_r_club = find_element(id: @selectors["pago"]["button_payment_continue"])
        $tools.click(@btn_r_club)   
        $tools.salvar_pantalla("Step2_Pago_Cuotas", "features/screenshots/step2_pago_cuotas/")          
    end

    def seleccionar_cantidad_cuotas_aleatorias
        random_cuotas = rand(1..6)
        @cuotas = find_element(id: @selectors["pago"]["cuotas"][random_cuotas])
        $tools.click(@cuotas) 
        cant_cuotas = get_cuotas(@selectors["pago"]["cuotas"][random_cuotas])
        $log.set_cuotas(cant_cuotas)
    end

    def get_cuotas(id)
        case id
        when "not_fee"
            return "Sin Cuotas"
        when "fee_3"
            return "3 cuotas"
        when "fee_6"
            return "6 cuotas"
        when "fee_12"
            return "12 cuotas"
        when "fee_18"
            return "18 cuotas"
        when "fee_24"
            return "24 cuotas"
        when "fee_36"
            return "36 cuotas"
        end
    end

    def seleccionar_otra_cantidad(cuotas)
        @cuotas = find_element(id: @selectors["pago"]["cuotas"][7])
        $tools.click(@cuotas) 
        @txtDatos = find_element(id: @selectors["general"]["txtDatos"])
        $tools.insertar_texto(@txtDatos, cuotas)
        @buttom_go_pay_cart = find_element(id: @selectors["general"]["buttom_go_pay_cart"])
        $tools.click(@buttom_go_pay_cart)
        $log.set_cuotas(cuotas)
        sleep 2
    end
   

end