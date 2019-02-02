
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <ul class="nav nav-pills nav-stacked list-unstyled bg-warning">  
            <li class="active"><s:a href="index.jsp">Inicio <span class="glyphicon glyphicon-home pull-right"></span></s:a> </li>
              
                    <li>                     
                        <a href="#usuario" data-toggle="collapse" aria-expanded="false">Clientes <span class="glyphicon glyphicon-menu-down pull-right"></span></a>                    
                        <ul class=" nav collapse " id="usuario">                    
                            <li ><s:a href="index.jsp">Agregar nuevo cliente</s:a></li>
                            </ul>
                        </li>
              

                <li>
                    <a href="#sectores" data-toggle="collapse" aria-expanded="false">Vehículos  <span class="glyphicon glyphicon glyphicon-menu-down pull-right"></span></a>
                    <ul class="nav collapse" id="sectores">
                        <li><s:a href="vehiculo.jsp">Agregar nuevo vehículo  </s:a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#colmenas" data-toggle="collapse" aria-expanded="false">Agencia  <span class="glyphicon glyphicon glyphicon glyphicon-menu-down pull-right"></span></a>
                        <ul class="nav collapse" id="colmenas">
                            <li><s:a href="agencia.jsp">Agregar nueva Agencia </s:a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#acciones" data-toggle="collapse" aria-expanded="false">Consultas <span class="glyphicon glyphicon-menu-down pull-right"></span></a>
                        <ul class="nav collapse" id="acciones">
                        <s:url action="v_reservas" var="v_reservas">                           
                        </s:url>
                            <li><s:a href="ver_reservas.jsp">Ver reservas</s:a></li>
                        <li><s:a href="%{v_reservas}">Actualizar</s:a></li>                     
                        </ul>
                    </li>
           

        </ul>


    </body>
</html>
