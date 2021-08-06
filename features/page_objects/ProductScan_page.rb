class ProductScanPage
  
    def initialize
        @selectors = JSON.parse(File.read("./features/selectors/all_selectors.json"))
        @datos = JSON.parse(File.read("./features/data/datos.json"))
    end

    def verificar_pagina
        begin
            @textView4 = find_element(id: @selectors["scan_products"]["textView4"])
            $tools.esperar_elemento(@textView4)
        rescue
            $tools.fallo("No se visualiza la página de escanear productos")
        end
    end

    def click_ingresar_producto
        @btnBarCode = find_element(id: @selectors["general"]["btnBarCode"])
        $tools.click(@btnBarCode)
    end

    def ingresar_productos_diferentes(cant)
        pivot = 0
        cant_real = @datos["sku"].count
        if cant <= cant_real
            while pivot < cant
                click_ingresar_producto
                sku = @datos["sku"][pivot]
                insertarTexto_field_data(sku)
                click_buttom_go_pay_cart 
                $log.add_sku_list(sku)
                pivot += 1
            end
        else
            $tools.fallo("Desea ingresar una cantidad de productos mayor a la que estan habilitados")
        end
    end

    def ingresar_productos_iguales(cant)
        pivot = 0
        cant_real = @datos["sku"].count
        random_product = rand(0..cant_real)
        while pivot < cant
            click_ingresar_producto
            sku = @datos["sku"][random_product]
            insertarTexto_field_data(sku)
            click_buttom_go_pay_cart 
            $log.add_sku_list(sku)
            pivot += 1
        end
    end

    def insertarTexto_field_data(text)
        @txtDatos = find_element(id: @selectors["general"]["txtDatos"])
        $tools.insertar_texto(@txtDatos, text)
    end

    def click_buttom_go_pay_cart    
        @buttom_go_pay_cart = find_element(id: @selectors["general"]["buttom_go_pay_cart"])
        $tools.click(@buttom_go_pay_cart)
        sleep 2
    end

    def click_pagar
        sleep 2
        $tools.salvar_pantalla("Step1_Scan", "features/screenshots/step1_scan/")
        click_buttom_go_pay_cart
    end

    def ingresar_codigo_producto
        sku = @datos["sku"].shuffle.first 
        insertarTexto_field_data(sku)
        click_buttom_go_pay_cart 
        $log.add_sku_list(sku)
    end

    def click_RCLUBES
        @btn_r_club = find_element(id: @selectors["Resumen"]["btn_r_club"])
        $tools.click(@btn_r_club)
    end

    def click_ingresar_descuento
        @btn_c_desc = find_element(id: @selectors["Resumen"]["btn_c_desc"])
        $tools.click(@btn_c_desc)
    end

    def ingresarRClubes
        rclubes = @datos["Rclubes"].shuffle.first 
        insertarTexto_field_data(rclubes)
        click_buttom_go_pay_cart
        $log.set_rclubes(rclubes)
        sleep 5 
    end

    def ingresar_codigo_descuento
        codDesc = @datos["cuponDescuento"].shuffle.first 
        insertarTexto_field_data(codDesc)
        click_buttom_go_pay_cart
        $log.set_descuento(codDesc)
        sleep 5 
    end

    def ingresar_rut_comprador(tipo_comprador) 
        $log.set_tipo_comprador(tipo_comprador)      
        rut_comprador = @datos[tipo_comprador].shuffle.first
        insertarTexto_field_data(rut_comprador)
        click_buttom_go_pay_cart
        $log.set_rut_comprador(rut_comprador)
    end 

end