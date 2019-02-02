
<%@page import="Entidades.Cliente"%>
<%@page import="com.sun.security.ntlm.Client"%>
<%@page import="java.util.List"%>
<%@page import="Datos.GuardarCliente"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Ver Reservas</title>
    </head>
    <body>


        <div class="row content">
            <div class="col-md-2 col-sm-2">
                <jsp:include page="menu.jsp" /> 
            </div>

            <div class="col-md-8 col-sm-8">
                <div class="container col-md-12">
                    <div class="col-md-9 col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading"><h3 class="  text-warning">Ver reservas <s:property value="idreserva"/></h3></div>
                            <div class="panel-body" style="min-height: 600px; max-height: 750px;overflow-y: scroll;">
                                <s:if test="dc_consumo_mensaje!=null">
                                    <div class="alert <s:property value="style"/> alert-dismissible">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <strong>¡<s:property value="estado"/>!</strong> <s:property value="dc_consumo_mensaje"/>.
                                    </div>
                                </s:if>                                
                                <form action="ver_reserva" class="form-horizontal" method="post" id="formulario">






                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="Ingresa la placa">Actualiza Costo *</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control required" value="<s:property value="costro"/>" name="costo" maxlength="35" placeholder="Ingresa la placa"/> 
                                            <br> <input type="submit" class=" btn btn-info " value="Actualizar" id="boton"/> 
                                        </div>
                                    </div>

                                </form>

                                <br><br><br>
                      

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-2 sidenav">
                <div class="well">
                    <p>Nuestros vehículos</p>
                    <img src="images/v.png" class="img-thumbnail" />
                </div>
                <div class="well">   
                    <p>Calidad de motores</p>
                    <img src="images/v2.jpg" class="img-thumbnail" />                   
                </div>
            </div>        </div>

        <footer class="container-fluid text-center">
            <p>Footer Text</p>
        </footer>
        <script type="text/javascript" src="assets/jQuery/jquery-3.3.1.min.js" ></script>
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js" ></script>        
        <script type="text/javascript" src="js/jquery.validate.min.js" ></script>    
        <script type="text/javascript" src="js/messages_es.js" ></script>   
        <script type="text/javascript" src="js/usuario.js">

        </script>
        <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery.dataTables.min.js"></script>
        <script src="js/dataTables.bootstrap.min.js"></script>

        <script >
          $(document).ready(function () {


          });
        </script>
    </body>
</html>
