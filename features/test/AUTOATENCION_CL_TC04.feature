Feature: AUTOATENCION_CL_TC04

   Scenario: TC04
      Given Abierta la aplicacion de autoatencion RPOST "AUTOATENCION_TC04"
      # Then En monitor configuro rut del empleador
      # And Guardo y salgo del monitor
      And Realizo click en digitar codigo de producto
      And Ingreso numero de producto
      And Realizo click en Ingresar Codigo de Descuento
      And Ingreso Codigo de Descuento
      And Realizo click en pagar
      And Ingreso rut de comprador "rut_funcionario"
      And Selecciono tarjeta "debit_card"
      And Imprimo boleta
      And Realizo click en finalizar
      Then Verifico página de scan de productos presente