Feature: AUTOATENCION_CL_TC03

   Scenario: TC03
      Given Abierta la aplicacion de autoatencion RPOST "AUTOATENCION_TC03"
      # Then En monitor configuro rut del empleador
      # And Guardo y salgo del monitor
      And Ingreso varios productos con el mismo SKU 2
      And Realizo click en RCLUBES
      And Ingreso codigo RCLUBES
      And Realizo click en pagar
      And Ingreso rut de comprador "rut_cliente"
      And Selecciono tarjeta "credit_card"
      And Imprimo boleta
      And Realizo click en finalizar
      Then Verifico página de scan de productos presente