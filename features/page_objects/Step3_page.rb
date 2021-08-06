class Step3
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/all_selectors.json"))
    end

    def seleccionar_cantidad_ticket_cambio(cant)
        @more_ticket =  find_element(id: @selectors["step_3"]["more_ticket"])
        @txt_ticket_quantity =  find_element(id: @selectors["step_3"]["txt_ticket_quantity"])
        cantidad_mostrada = @txt_ticket_quantity.text.to_i
        if ($cantidad_productos > 1 && $cantidad_productos >= cant)
            while cantidad_mostrada < cant
                $tools.click(@more_ticket) 
                cantidad_mostrada = @txt_ticket_quantity.text.to_i
            end
        elsif $cantidad_productos < cant
            puts "No se puede seleccionar #{cant} Ticket de Cambio ya que se ingresó solo #{$cantidad_productos} Producto, se insertara el tope maximo"
            while cantidad_mostrada < $cantidad_productos
                $tools.click(@more_ticket) 
                cantidad_mostrada = @txt_ticket_quantity.text.to_i
            end
        end
    end

    def seleccionar_Imprimir_Boleta
        @btn_print_ticket =  find_element(id: @selectors["step_3"]["btn_print_ticket"])
        $tools.click(@btn_print_ticket)             
    end

    def click_finalizar_compra
        $tools.salvar_pantalla("Step3_Confirmacion", "features/screenshots/step3_confirmacion/")  
        begin
            @btn_new_buy =  find_element(id: @selectors["step_3"]["btn_new_buy"])
            $tools.click(@btn_new_buy)       
            $end = true      
        rescue
            $tools.fallo("Error al Finalizar la Compra")
        end
    end
end