Feature: AUTOATENCION_CL_TC01

   Scenario: TC01
      Given Abierta la aplicacion de autoatencion RPOST "AUTOATENCION_TC01"
      # When En monitor configuro rut del empleador
      # And Guardo y salgo del monitor
      And Realizo click en digitar codigo de producto
      And Ingreso numero de producto
      And Realizo click en RCLUBES
      And Ingreso codigo RCLUBES
      And Realizo click en Ingresar Codigo de Descuento
      And Ingreso Codigo de Descuento
      And Realizo click en pagar
      And Ingreso rut de comprador "rut_cliente"
      And Selecciono tarjeta "ripley_card"
      And Realizo click en Continuar
      And Imprimo boleta
      And Realizo click en finalizar
      Then Verifico página de scan de productos presente