/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

  
    var formulario = $("#formulario");
    

 


    jQuery(formulario).validate(
            {
                rules: {
                    

                },
                messages: {
                    clave: {
                        minlength: $.format("Necesitamos por lo menos {0} caracteres")
                    }
                }

            }

    );

   








});